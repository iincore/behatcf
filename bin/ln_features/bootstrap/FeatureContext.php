<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\Behat\Context\Step;

$dir = dirname(dirname(dirname(dirname( __FILE__ )))) . '/';
//Load Database drivers
require( $dir . 'vendor/gabordemooij/redbean/RedBean/redbean.inc.php' );
/**
 * Features context.gaboardemooij
 */
class FeatureContext extends \Behat\MinkExtension\Context\MinkContext
{
    private $params = array();
    private $keyCodes = array('up' => 38, 'down' => 40, 'enter' => 13);
    var $originalWindowName = '';
    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param   array   $parameters     context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        $this->params = $parameters;
        // Initialize your context here
    }

    /**
     * @Given /^(?:|I )am logged in as "([^"]*)" and "([^"]*)"$/
     */
    public function iAmLoggedInAs($username, $password)
    {
        //require_once __DIR__ . '/steps/admin-login.php';
        $username = $this->replaceParameter($username);
        $password = $this->replaceParameter($password);
        return array(
//            new Step\When('I maximize the window'),
            new Step\When('I am on "/"'),
            new Step\When('I fill in "session_key" with "'.$username.'"'),
            new Step\When('I fill in "session_password" with "'.$password.'"'),
            new Step\When('I press "signin"'),
            new Step\When('I should see "Home"'),
        );
    }

    /**
     * @Then /^I manually press "([^"]*)" key on xpath "([^"]*)"$/
     */
    public function iManuallyPressKeyOn($key, $xpath)
    {
        $key = $this->replaceParameter($key);
        if(isset($this->keyCodes[$key])){
            $key = $this->keyCodes[$key];
        }
        $this->getSession()->getDriver()->keyPress($this->getSession()->getSelectorsHandler()->selectorToXpath('xpath', $xpath), $key);
    }

    /**
     * @Then /^I start crawling$/
     */
    public function iStartCrawling()
    {
        $this->redBeanSetup();

        //get list of outbound urls from DB which are not exists in system
        $query = "select id, source, outboundlinks from cf_crawled_resumes
        where source like '%linkedin%'
        and outboundlinks != ''";
        $result = R::getAll($query);
//        $path = "https://www.linkedin.com/pub/long-chen/1a/1/8a1";
        $session = $this->getSession();
        foreach($result as $r){
            if($r['outboundlinks']){
                $links = json_decode($r['outboundlinks'], true);
                foreach($links as $link){
                    try{
//                        print_r($result);
                        echo "Pushing html for " .$link."\n";
                        $this->dumpHtml($session, $link);
                    } catch (Exception $ex){
                        echo "Exception occured " .$ex->getMessage()."\n";
                        throw new \Exception(sprintf('failed due to assertion not validated for value '));
                    }
                }
            }
        }
    }

    public function dumpHtml($session, $url){
        $query = "select id from cf_crawled_resumes
        where source = :source";
        $result = R::exec($query, [':source' => trim($url) ]);
//        print_r($result);
        if($result == 0){
            $query = "select id from cf_crawled_html
            where url = :source";
            $result = R::exec($query, [':source' => trim($url) ]);
            if($result == 0){
                $session->visit($url);

                $result =  $session->getPage()->getHtml();
                $res = R::exec('INSERT into cf_crawled_html (url, html, processed)
             values (:url, :html, false)',
                    [
                        ':url' => $url,
                        ':html' => $result,
                    ]);
                if($res){
                    echo "Pushed html for " .$url."\n";
                }
            }
//            $time = 60 * 100;
//            $this->getSession()->wait($time);
        } else {
            echo "URL already processed " .$url."\n";
        }
    }


    public function createListOfProfileLinks(){
        $cssSelector = "h3.name > a:nth-child(1)";
        $session = $this->getSession(); // get the mink session
        $elements = $session->getPage()->findAll(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $elements) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate css path: "%s"', $cssSelector));
        }

        $text = "";
        foreach($elements as $e){
            $text .= $e->getAttribute('href')."\n";
        }

        throw new Exception($text . ' not find in element');
    }


    public function clickOnConnections(){
        $function = <<<JS
            (function(){
             target = '#responsive-nav-scrollable';
                $(target).find('ul.nav.main-nav li').each(function() {
                if($(this).find('a').text().trim() == "Connections"){
                        $(this).find('a').click();
                    }
                });
            })()
JS;
        try{
            $this->getSession()->executeScript($function);
        } catch (Exception $ex){
            throw new \Exception(sprintf('failed due to link not found.'));
        }
    }

    /**
     * @Then /^I assert admin search field "([^"]*)" value "([^"]*)"$/
     */
    public function iCompareAdminSearchResults($field, $value)
    {
        $field = $this->replaceParameter($field);
        $value = $this->replaceParameter($value);
        $result = true;
        //Js for setting id to iframe
        $function = <<<JS
            (function(){
             target = '#users';
             var a = '$field';
                $(target).find('tr').each(function() {
                    switch(a){
                        case "Percentage More":
                           var pp =  $(this).find('td > span').html().trim();
                           var pv = parseInt('$value');
                           pp = pp.replace("%", "");
                           if(pp < pv){
                                 throw 'failed';
                           }
                        break;
                        case "Percentage Less":
                           var pp =  $(this).find('td > span').html().trim();
                           var pv = parseInt('$value');
                           pp = pp.replace("%", "");
                           if(pp > pv){
                                 throw 'failed';
                           }
                        break;
                    }
                });
            })()
JS;
        try{
            $this->getSession()->executeScript($function);
        } catch (Exception $ex){
            throw new \Exception(sprintf('%s failed due to assertion not validated for value %s', $field, $value));
        }
    }

    /**
     * @Then /^I check popup window text "([^"]*)"$/
     */
    public function iCheckPopupWindowText($text)
    {
        //$session->expectDialog(Session::ALERT_DIALOG)->withText('dialog text here')->thenPressOK();
        $this->getSession()->getDriver()->DriverSession()->accept_alert();
    }

    /**
     * @Given /^I look for the output wait "([^"]*)" seconds$/
     */
    public function iLookForTheOutputToAppear($time = 60)
    {
        $time = $time * 100;
        $this->getSession()->wait($time
        );
    }

    /**
     * @When /^I set value in "([^"]*)" with "([^"]*)"$/
     */
    public function iSetValueInWith($arg1, $arg2)
    {
        $arg1 = $this->replaceParameter($arg1);
        $arg2 = $this->replaceParameter($arg2);
        $javascript = "$('".$arg1."').val('". $arg2 ."')";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @When /^I set value in using "([^"]*)" tag with "([^"]*)"$/
     */
    public function iSetValueUsingTagWith($arg1, $arg2)
    {
        $arg1 = $this->replaceParameter($arg1);
        $arg2 = $this->replaceParameter($arg2);
        $javascript = <<<JS
            (function(){
             document.body.innerHTML = '$arg2';
            })()
JS;
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I change field "([^"]*)" value with "([^"]*)"$/
     */
    public function iChangeFieldValueWith($field, $value)
    {
        $field = $this->replaceParameter($field);
        $value = $this->replaceParameter($value);
        $javascript = "$('".$field."').prop('readonly',false);";
        $javascript .= "$('".$field."').val('".$value."');";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I remove class "([^"]*)" from field "([^"]*)"$/
     */
    public function iRemoveClassFromField($class, $field)
    {
        $class = $this->replaceParameter($class);
        $field = $this->replaceParameter($field);
        $javascript = "$('".$field."').removeClass('".$class."');";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I add class "([^"]*)" to field "([^"]*)"$/
     */
    public function iAddClassFromField($class, $field)
    {
        $class = $this->replaceParameter($class);
        $field = $this->replaceParameter($field);
        $javascript = "$('".$field."').addClass('".$class."');";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I submit the form "([^"]*)"$/
     */
    public function iSubmitTheForm($field)
    {
        $field = $this->replaceParameter($field);
        $javascript = "$('".$field."').submit();";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I click on field "([^"]*)"$/
     */
    public function iClickOnFieldWith($field)
    {
        $field = $this->replaceParameter($field);
        $javascript = "$('".$field."').click()";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * Click on the element with the provided xpath query
     *
     * @When /^I click on the element with xpath "([^"]*)"$/
     */
    public function iClickOnTheElementWithXPath($xpath)
    {
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }
        // ok, let's click on it
        $element->click();
    }

    /**
     * Click on the element with the provided xpath query
     *
     * @When /^I check text "([^"]*)" in the element with xpath "([^"]*)"$/
     */
    public function iCheckTextInTheElementWithXPath($text, $xpath)
    {
        $text = $this->replaceParameter($text);
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }

        if(substr_count($element->getText(), trim($text)) == 0){
            throw new Exception($text . ' not find in element');
        }
    }
    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I click on the element with css selector "([^"]*)"$/
     */
    public function iClickOnTheElementWithCSSSelector($cssSelector)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector) // just changed xpath to css
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS Selector: "%s"', $cssSelector));
        }
        $element->click();
    }

    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I Check on the element with css selector "([^"]*)"$/
     */
    public function iCheckOnTheElementWithCSSSelector($cssSelector)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector) // just changed xpath to css
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS Selector: "%s"', $cssSelector));
        }
        $element->check();
    }

    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I Uncheck on the element with css selector "([^"]*)"$/
     */
    public function iUnCheckOnTheElementWithCSSSelector($cssSelector)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector) // just changed xpath to css
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS Selector: "%s"', $cssSelector));
        }
        $element->uncheck();
    }

    /**
     * Click on the element with the provided CSS Selector
     *
     * @When /^I Select on the option with css selector "([^"]*)" with "([^"]*)"$/
     */
    public function iSelectTheOptionWithCSSSelector($cssSelector, $value)
    {
        $session = $this->getSession();
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('css', $cssSelector) // just changed xpath to css
        );
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate CSS Selector: "%s"', $cssSelector));
        }
        $element->selectOption($value, true);
    }

    //get user name
    //get roles by username
    //If role is Admin then go to 1 student, 2 employer, 3 admin all ok
    //If role is Employer then go to 1 student ok, 2 employer ok, 3 admin Awk
    //If role is Student then go to 1 student ok, 2 employer Awk, 3 admin Awk

    /**
     * @Then /^I check role of "([^"]*)" with "([^"]*)"$/
     */
    public function iCheckRoleOfWith($username, $role)
    {
        $username = $this->replaceParameter($username);
        $role = $this->replaceParameter($role);
        $query = "select roles from cf_user where username = '$username' and roles like '%$role%'";
        $result = $this->getQueryResult($query);
//      $steps = array();
//      $step =  new Step\When('I fill in "username" with "'.$username.'"');
//      new Step\When('I fill in "password" with "'.$password.'"');
        if(empty($result)){
            throw new Exception($username.' is not '.$role);
        }
    }

    /**
     * @Given /^I check location in db "([^"]*)" for username "([^"]*)"$/
     */
    public function CheckCurrentLocation($location, $username)
    {
        $username = $this->replaceParameter($username);
        $location = $this->replaceParameter($location);
        $query = "select * from cf_profile_settings a
                    Join cf_user u on a.owner_id = u.id
                    where u.username = '$username'
                    and current_location like like '%$location%'";
        $result = $this->getQueryResult($query);

        if(empty($result)){
            throw new Exception($location.' is not set in DB');
        }
    }

    /**
     * @Given /^I exec query "([^"]*)" on db throw exception "([^"]*)"$/
     */
    public function iExecQueryOnDb($query, $ex)
    {
        $result = $this->getQueryResult($query);
        if(empty($result)){
            throw new Exception($ex);
        }
    }

    /**
     * @When /^I switch to iframe "([^"]*)"$/
     */
    public function iSwitchToIFrame($arg1)
    {
        $arg1 = $this->replaceParameter($arg1);
        $id = 'ifm-' . rand(1000, 9999);
        //Js for setting id to iframe
        $function = <<<JS
            (function(){
              var elem = document.getElementById("$arg1");
              var iframes = elem.getElementsByTagName('iframe');
              var f = iframes[0];
              f.id = "$id";
            })()
JS;
        try {
            $this->getSession()->executeScript($function);
        }
        catch(Exception $e) {
            throw new \Exception(sprintf('No iframe found in the element "%s" on the page "%s".', $arg1, $this->getSession()->getCurrentUrl()));
        }

        $this->getSession()->wait(5000);
        $this->getSession()->switchToIFrame($id);
    }

    /**
     * @Then /^I switch back from iframe$/
     */
    public function iSwitchBackFromIFrame()
    {
        $this->getSession()->wait(5000);
        $this->getSession()->switchToIFrame();
    }

    /**
     * @Then /^I switch to popup$/
     */
    public function iSwitchToPopup() {
        $originalWindowName = $this->getSession()->getWindowName(); //Get the original name

        if (empty($this->originalWindowName)) {
            $this->originalWindowName = $originalWindowName;
        }

        // $this->getSession()->getPage()->pressButton($button); //Pressing the withdraw button

        $popupName = $this->getNewPopup($originalWindowName);

        //Switch to the popup Window
        $this->getSession()->switchToWindow($popupName);
    }

    /**
     * @Then /^I switch back to original window$/
     */
    public function iSwitchBackToOriginalWindow() {
        //Switch to the original window
        $this->getSession()->switchToWindow($this->originalWindowName);
    }

    /**
     * This gets the window name of the new popup.
     */
    private function getNewPopup($originalWindowName = NULL) {
        //Get all of the window names first
        $names = $this->getSession()->getWindowNames();

        //Now it should be the last window name
        $last = array_pop($names);

        if (!empty($originalWindowName)) {
            while ($last == $originalWindowName && !empty($names)) {
                $last = array_pop($names);
            }
        }
        return $last;
    }

    /**
     * @Given /^I maximize the window$/
     */
    public function iMaximizeTheWindow()
    {
        $this->getSession()->getDriver()->resizeWindow(1366, 768);
//        $this->getSession()->getDriver()->maximizeWindow();
    }

    public function replaceParameter($param){
        if(substr_count($param, '{') > 0)
        {
            preg_match('~{(.*?)}~', $param, $output);
            foreach($output as $name){
                if(isset($this->params[$name])){
                    $param = str_replace('{'.$name.'}', $this->params[$name], $param);
                }
            }
        }
        return $param;
    }

    public function redBeanSetup(){
        $host = $this->params['host'];
        $username = $this->params['db_username'];
        $password = $this->params['db_password'];
        $db = $this->params['db'];
        R::setup("mysql:host=$host;dbname=$db", $username, $password);
    }

    public function getQueryResult($query)
    {

        $host = $this->params['host'];
        $username = $this->params['db_username'];
        $password = $this->params['db_password'];
        $db = $this->params['db'];

        $dbhandle = mysql_connect($host, $username, $password)
        or die("Unable to connect to MySQL");
        $con = mysqli_connect($host,$username,$password,$db);
        $result = mysqli_query($con, $query);
        $query = "";
        return mysqli_fetch_array($result);
    }

}
