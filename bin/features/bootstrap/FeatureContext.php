<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\Behat\Context\Step;

//use Behat\MinkExtension\Context\MinkContext;

/**
 * Features context.
 */
class FeatureContext extends \Behat\MinkExtension\Context\RawMinkContext implements TranslatedContextInterface
{
    private $params = array();
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
            new Step\When('I maximize the window'),
            new Step\When('I am on "/login"'),
            new Step\When('I fill in "username" with "'.$username.'"'),
            new Step\When('I fill in "password" with "'.$password.'"'),
            new Step\When('I press "_submit"'),
            new Step\When('I should see "Dashboard"'),
        );
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
        $session = $this->getSession(); // get the mink session
        $element = $session->getPage()->find(
            'xpath',
            $session->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
        ); // runs the actual query and returns the element

        // errors must not pass silently
        if (null === $element) {
            throw new \InvalidArgumentException(sprintf('Could not evaluate XPath: "%s"', $xpath));
        }
        if(trim($text) != trim($element->getText())){
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

    #region Core Context methods

    /**
     * Opens homepage.
     *
     * @Given /^(?:|I )am on (?:|the )homepage$/
     * @When /^(?:|I )go to (?:|the )homepage$/
     */
    public function iAmOnHomepage()
    {
        $this->getSession()->visit($this->locatePath('/'));
    }

    /**
     * Opens specified page.
     *
     * @Given /^(?:|I )am on "(?P<page>[^"]+)"$/
     * @When /^(?:|I )go to "(?P<page>[^"]+)"$/
     */
    public function visit($page)
    {
        $this->getSession()->visit($this->locatePath($page));
    }

    /**
     * Reloads current page.
     *
     * @When /^(?:|I )reload the page$/
     */
    public function reload()
    {
        $this->getSession()->reload();
    }

    /**
     * Moves backward one page in history.
     *
     * @When /^(?:|I )move backward one page$/
     */
    public function back()
    {
        $this->getSession()->back();
    }

    /**
     * Moves forward one page in history
     *
     * @When /^(?:|I )move forward one page$/
     */
    public function forward()
    {
        $this->getSession()->forward();
    }

    /**
     * Presses button with specified id|name|title|alt|value.
     *
     * @When /^(?:|I )press "(?P<button>(?:[^"]|\\")*)"$/
     */
    public function pressButton($button)
    {
        $button = $this->fixStepArgument($button);
        $this->getSession()->getPage()->pressButton($button);
    }

    /**
     * Clicks link with specified id|title|alt|text.
     *
     * @When /^(?:|I )follow "(?P<link>(?:[^"]|\\")*)"$/
     */
    public function clickLink($link)
    {
        $link = $this->fixStepArgument($link);
        $this->getSession()->getPage()->clickLink($link);
    }

    /**
     * Fills in form field with specified id|name|label|value.
     *
     * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with "(?P<value>(?:[^"]|\\")*)"$/
     * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with:$/
     * @When /^(?:|I )fill in "(?P<value>(?:[^"]|\\")*)" for "(?P<field>(?:[^"]|\\")*)"$/
     */
    public function fillField($field, $value)
    {
        $field = $this->replaceParameter($field);
        $value = $this->replaceParameter($value);

        $field = $this->fixStepArgument($field);
        $value = $this->fixStepArgument($value);
        $this->getSession()->getPage()->fillField($field, $value);
    }

    /**
     * Fills in form fields with provided table.
     *
     * @When /^(?:|I )fill in the following:$/
     */
    public function fillFields(TableNode $fields)
    {
        foreach ($fields->getRowsHash() as $field => $value) {
            $this->fillField($field, $value);
        }
    }

    /**
     * Selects option in select field with specified id|name|label|value.
     *
     * @When /^(?:|I )select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
     */
    public function selectOption($select, $option)
    {
        $select = $this->fixStepArgument($select);
        $option = $this->fixStepArgument($option);
        $this->getSession()->getPage()->selectFieldOption($select, $option);
    }

    /**
     * Selects additional option in select field with specified id|name|label|value.
     *
     * @When /^(?:|I )additionally select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
     */
    public function additionallySelectOption($select, $option)
    {
        $select = $this->fixStepArgument($select);
        $option = $this->fixStepArgument($option);
        $this->getSession()->getPage()->selectFieldOption($select, $option, true);
    }

    /**
     * Checks checkbox with specified id|name|label|value.
     *
     * @When /^(?:|I )check "(?P<option>(?:[^"]|\\")*)"$/
     */
    public function checkOption($option)
    {
        $option = $this->fixStepArgument($option);
        $this->getSession()->getPage()->checkField($option);
    }

    /**
     * Unchecks checkbox with specified id|name|label|value.
     *
     * @When /^(?:|I )uncheck "(?P<option>(?:[^"]|\\")*)"$/
     */
    public function uncheckOption($option)
    {
        $option = $this->fixStepArgument($option);
        $this->getSession()->getPage()->uncheckField($option);
    }

    /**
     * Attaches file to field with specified id|name|label|value.
     *
     * @When /^(?:|I )attach the file "(?P<path>[^"]*)" to "(?P<field>(?:[^"]|\\")*)"$/
     */
    public function attachFileToField($field, $path)
    {
        $field = $this->fixStepArgument($field);

        if ($this->getMinkParameter('files_path')) {
            $fullPath = rtrim(realpath($this->getMinkParameter('files_path')), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$path;
            if (is_file($fullPath)) {
                $path = $fullPath;
            }
        }

        $this->getSession()->getPage()->attachFileToField($field, $path);
    }

    /**
     * Checks, that current page PATH is equal to specified.
     *
     * @Then /^(?:|I )should be on "(?P<page>[^"]+)"$/
     */
    public function assertPageAddress($page)
    {
        $this->assertSession()->addressEquals($this->locatePath($page));
    }

    /**
     * Checks, that current page is the homepage.
     *
     * @Then /^(?:|I )should be on (?:|the )homepage$/
     */
    public function assertHomepage()
    {
        $this->assertSession()->addressEquals($this->locatePath('/'));
    }

    /**
     * Checks, that current page PATH matches regular expression.
     *
     * @Then /^the (?i)url(?-i) should match (?P<pattern>"([^"]|\\")*")$/
     */
    public function assertUrlRegExp($pattern)
    {
        $this->assertSession()->addressMatches($this->fixStepArgument($pattern));
    }

    /**
     * Checks, that current page response status is equal to specified.
     *
     * @Then /^the response status code should be (?P<code>\d+)$/
     */
    public function assertResponseStatus($code)
    {
        $this->assertSession()->statusCodeEquals($code);
    }

    /**
     * Checks, that current page response status is not equal to specified.
     *
     * @Then /^the response status code should not be (?P<code>\d+)$/
     */
    public function assertResponseStatusIsNot($code)
    {
        $this->assertSession()->statusCodeNotEquals($code);
    }

    /**
     * Checks, that page contains specified text.
     *
     * @Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function assertPageContainsText($text)
    {
        $this->assertSession()->pageTextContains($this->fixStepArgument($text));
    }

    /**
     * Checks, that page doesn't contain specified text.
     *
     * @Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function assertPageNotContainsText($text)
    {
        $this->assertSession()->pageTextNotContains($this->fixStepArgument($text));
    }

    /**
     * Checks, that page contains text matching specified pattern.
     *
     * @Then /^(?:|I )should see text matching (?P<pattern>"(?:[^"]|\\")*")$/
     */
    public function assertPageMatchesText($pattern)
    {
        $this->assertSession()->pageTextMatches($this->fixStepArgument($pattern));
    }

    /**
     * Checks, that page doesn't contain text matching specified pattern.
     *
     * @Then /^(?:|I )should not see text matching (?P<pattern>"(?:[^"]|\\")*")$/
     */
    public function assertPageNotMatchesText($pattern)
    {
        $this->assertSession()->pageTextNotMatches($this->fixStepArgument($pattern));
    }

    /**
     * Checks, that HTML response contains specified string.
     *
     * @Then /^the response should contain "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function assertResponseContains($text)
    {
        $this->assertSession()->responseContains($this->fixStepArgument($text));
    }

    /**
     * Checks, that HTML response doesn't contain specified string.
     *
     * @Then /^the response should not contain "(?P<text>(?:[^"]|\\")*)"$/
     */
    public function assertResponseNotContains($text)
    {
        $this->assertSession()->responseNotContains($this->fixStepArgument($text));
    }

    /**
     * Checks, that element with specified CSS contains specified text.
     *
     * @Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
     */
    public function assertElementContainsText($element, $text)
    {
        $this->assertSession()->elementTextContains('css', $element, $this->fixStepArgument($text));
    }

    /**
     * Checks, that element with specified CSS doesn't contain specified text.
     *
     * @Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
     */
    public function assertElementNotContainsText($element, $text)
    {
        $this->assertSession()->elementTextNotContains('css', $element, $this->fixStepArgument($text));
    }

    /**
     * Checks, that element with specified CSS contains specified HTML.
     *
     * @Then /^the "(?P<element>[^"]*)" element should contain "(?P<value>(?:[^"]|\\")*)"$/
     */
    public function assertElementContains($element, $value)
    {
        $this->assertSession()->elementContains('css', $element, $this->fixStepArgument($value));
    }

    /**
     * Checks, that element with specified CSS doesn't contain specified HTML.
     *
     * @Then /^the "(?P<element>[^"]*)" element should not contain "(?P<value>(?:[^"]|\\")*)"$/
     */
    public function assertElementNotContains($element, $value)
    {
        $this->assertSession()->elementNotContains('css', $element, $this->fixStepArgument($value));
    }

    /**
     * Checks, that element with specified CSS exists on page.
     *
     * @Then /^(?:|I )should see an? "(?P<element>[^"]*)" element$/
     */
    public function assertElementOnPage($element)
    {
        $this->assertSession()->elementExists('css', $element);
    }

    /**
     * Checks, that element with specified CSS doesn't exist on page.
     *
     * @Then /^(?:|I )should not see an? "(?P<element>[^"]*)" element$/
     */
    public function assertElementNotOnPage($element)
    {
        $this->assertSession()->elementNotExists('css', $element);
    }

    /**
     * Checks, that form field with specified id|name|label|value has specified value.
     *
     * @Then /^the "(?P<field>(?:[^"]|\\")*)" field should contain "(?P<value>(?:[^"]|\\")*)"$/
     */
    public function assertFieldContains($field, $value)
    {
        $field = $this->fixStepArgument($field);
        $value = $this->fixStepArgument($value);
        $this->assertSession()->fieldValueEquals($field, $value);
    }

    /**
     * Checks, that form field with specified id|name|label|value doesn't have specified value.
     *
     * @Then /^the "(?P<field>(?:[^"]|\\")*)" field should not contain "(?P<value>(?:[^"]|\\")*)"$/
     */
    public function assertFieldNotContains($field, $value)
    {
        $field = $this->fixStepArgument($field);
        $value = $this->fixStepArgument($value);
        $this->assertSession()->fieldValueNotEquals($field, $value);
    }

    /**
     * Checks, that checkbox with specified in|name|label|value is checked.
     *
     * @Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should be checked$/
     * @Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" (?:is|should be) checked$/
     */
    public function assertCheckboxChecked($checkbox)
    {
        $this->assertSession()->checkboxChecked($this->fixStepArgument($checkbox));
    }

    /**
     * Checks, that checkbox with specified in|name|label|value is unchecked.
     *
     * @Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should not be checked$/
     * @Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" should (?:be unchecked|not be checked)$/
     * @Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" is (?:unchecked|not checked)$/
     */
    public function assertCheckboxNotChecked($checkbox)
    {
        $this->assertSession()->checkboxNotChecked($this->fixStepArgument($checkbox));
    }

    /**
     * Checks, that (?P<num>\d+) CSS elements exist on the page
     *
     * @Then /^(?:|I )should see (?P<num>\d+) "(?P<element>[^"]*)" elements?$/
     */
    public function assertNumElements($num, $element)
    {
        $this->assertSession()->elementsCount('css', $element, intval($num));
    }

    /**
     * Prints current URL to console.
     *
     * @Then /^print current URL$/
     */
    public function printCurrentUrl()
    {
        $this->printDebug($this->getSession()->getCurrentUrl());
    }

    /**
     * Prints last response to console.
     *
     * @Then /^print last response$/
     */
    public function printLastResponse()
    {
        $this->printDebug(
            $this->getSession()->getCurrentUrl()."\n\n".
            $this->getSession()->getPage()->getContent()
        );
    }

    /**
     * Opens last response content in browser.
     *
     * @Then /^show last response$/
     */
    public function showLastResponse()
    {
        if (null === $this->getMinkParameter('show_cmd')) {
            throw new \RuntimeException('Set "show_cmd" parameter in behat.yml to be able to open page in browser (ex.: "show_cmd: firefox %s")');
        }

        $filename = rtrim($this->getMinkParameter('show_tmp_dir'), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.uniqid().'.html';
        file_put_contents($filename, $this->getSession()->getPage()->getContent());
        system(sprintf($this->getMinkParameter('show_cmd'), escapeshellarg($filename)));
    }

    /**
     * Returns list of definition translation resources paths.
     *
     * @return array
     */
    public function getTranslationResources()
    {
        return $this->getMinkTranslationResources();
    }

    /**
     * Returns list of definition translation resources paths for this dictionary.
     *
     * @return array
     */
    public function getMinkTranslationResources()
    {
        return glob(__DIR__.'/../../../../i18n/*.xliff');
    }

    /**
     * Returns fixed step argument (with \\" replaced back to ").
     *
     * @param string $argument
     *
     * @return string
     */
    protected function fixStepArgument($argument)
    {
        return str_replace('\\"', '"', $argument);
    }

    #endregion
}
