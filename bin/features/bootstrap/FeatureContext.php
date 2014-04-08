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
     * @Given /^(?:|I )am logged in as "([^"]*)" and "([^"]*)"$/
     */
    public function iAmLoggedInAs($username, $password)
    {
        //require_once __DIR__ . '/steps/admin-login.php';
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
        $javascript = "$('#".$arg1."').val(". $arg2 .")";
        $this->getSession()->executeScript($javascript);
    }

    /**
     * @Given /^I click on field "([^"]*)"$/
     */
    public function iClickOnFieldWith($field)
    {
        $javascript = "$('".$field."').click()";
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

}
