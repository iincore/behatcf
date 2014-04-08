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

    /**
     * Initializes context.
     * Every scenario gets it's own context object.
     *
     * @param   array   $parameters     context parameters (set them up through behat.yml)
     */
    public function __construct(array $parameters)
    {
        // Initialize your context here
    }

    /**
     * @Given /^(?:|I )am logged in as Administrator$/
     */
    public function iAmLoggedInAsAdministrator()
    {
        //require_once __DIR__ . '/steps/admin-login.php';
        return array(
            new Step\When('I am on "/login"'),
            new Step\When('I fill in "username" with "lakshana"'),
            new Step\When('I fill in "password" with "collegefeed"'),
            new Step\When('I press "_submit"'),
            new Step\When('I should see "Dashboard"'),
        );
    }

    /**
     * @Given /^(?:|I )am logged in as Student$/
     */
    public function iAmLoggedInAsStudent()
    {
        return array(
            new Step\When('I am on "/login"'),
            new Step\When('I fill in "username" with "emp"'),
            new Step\When('I fill in "password" with "pass"'),
            new Step\When('I press "_submit"'),
        );
    }

    /**
     * @Given /^(?:|I )am logged in as Employer$/
     */
    public function iAmLoggedInAsEmployer()
    {
        return array(
            new Step\When('I am on "/login"'),
            new Step\When('I fill in "username" with "emp"'),
            new Step\When('I fill in "password" with "pass"'),
            new Step\When('I press "_submit"'),
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
        $javascript = "$('#".$arg1."').val(". $arg2 .")";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I click on field "([^"]*)"$/
     */
    public function iClickOnFieldWith($field)
    {
        $javascript = "$('#".$field."').click()";
        $this->getSession()->executeScript($javascript);

//        assertNotNull($this->find(
//            'xpath',
//            '//div[contains(@class, "notification-message") and contains(@class, "'.$type.'") and contains(., "'.$message.'")]'
//        ), "Notification of type '$type' with message '$message' was not found on page");

//          $this->getSession()->getPage()->find('css',
//            'input[id="'.$field.'"]')->click();
    }

//    /**
//     * @Given /^I am on "([^"]*)"$/
//     */
//    public function iAmOn($arg1)
//    {
//        //throw new PendingException();
//    }




}
