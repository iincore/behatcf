Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario: Login to collegefeed using good data
    Given I am on "/login"
    When I fill in "username" with "{username}"
    And I fill in "password" with "{password}"
    Then I press "_submit"
    And I should see "Dashboard"
    When I follow "Profile"
    And I should see "Public profile"

  @javascript
  Scenario: try and login with wrong username and password
    Given I am on "/login"
    When I fill in "username" with "parvinder"
    And I fill in "password" with "collegefeed"
    Then I press "_submit"
    And I should see "Invalid username or password"

#Other wrong cases to check all the validations