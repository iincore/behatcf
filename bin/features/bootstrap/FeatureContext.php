<?php

use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Behat\Behat\Context\Step;

use Behat\MinkExtension\Context\MinkContext;

/**
 * Features context.
 */
class FeatureContext extends MinkContext
{
    private $params = array();
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
        $javascript = "$('#".$arg1."').val('". $arg2 ."')";
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

//        assertNotNull($this->find(
//            'xpath',
//            '//div[contains(@class, "notification-message") and contains(@class, "'.$type.'") and contains(., "'.$message.'")]'
//        ), "Notification of type '$type' with message '$message' was not found on page");

//          $this->getSession()->getPage()->find('css',
//            'input[id="'.$field.'"]')->click();
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
     * @Given /^I check role of "([^"]*)" with "([^"]*)"$/
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
     * @Given /^I switch to window "([^"]*)"$/
     */
    public function iSwitchToWindow($arg1)
    {
        $arg1 = $this->replaceParameter($arg1);
        $this->getSession()->wait(5000);
        $this->getSession()->switchToWindow($arg1);
    }

    /**
     * @Given /^I maximize the window "([^"]*)"$/
     */
    public function iMaximizeTheWindow($arg1)
    {
        $arg1 = $this->replaceParameter($arg1);
        $this->getSession()->getDriver()->resizeWindow(1200, 800);
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
}
