Feature: collegefeed sign up
	In order to create my profile on collegefeed
	As a student
	I need to be able to sign up to the collegefeed

Background:
	# Setup any feature dependencies

Scenario: Sign up to collegefeed using good data
	Given I am on "register/"
	And I fill in "email" with "parvinder@mywebsite.com"
	And I fill in "password" with "parv123"
	Then I press "_submit"
	And I should be on "signup.php"
	And I should see "Thanks for signing up! A million marketing emails are on the way!"
	And I should not see "Uncheck this tickbox"

Scenario: try and sign up in collegefeed but typo in email
	Given I am on "register/"
	And I fill in "email" with "adfsadfsa#ymail.com"
    And I fill in "password" with "parv123"
	Then I press "_submit"
	And I should be on "register/"
	And I should see "Please, enter a valid email"

Scenario: try and sign up in collegefeed but forgot to enter password
    Given I am on "register/"
    And I fill in "email" with "adfsadfsa#ymail.com"
    Then I press "_submit"
    And I should be on "register/"
    And I should see "Please, enter a valid password"
