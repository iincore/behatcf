Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill All the sections in the page
    Given I am logged in as "lakshana" and "collegefeed"
    Then I should see "Dashboard"
    Then I look for the output wait "30" seconds

  #
  #Search with company
  #
    When I follow "Companies"
    Then I look for the output wait "30" seconds
    Then I should see "Companies on collegefeed"
    And I fill in "company" with "Facebook"
    Then I press "Update"
    And I look for the output wait "100" seconds
    Then I should see "Facebook"
    When I click on the element with xpath "//div[2]/div[2]/div[2]/div/div[3]/div/div/div/a[2]"
    And I look for the output wait "60" seconds
    Then I should see "Unfollow Facebook"
    When I click on the element with xpath "//div[2]/div[2]/div[2]/div/div[3]/div/div/div/a[2]"
    And I look for the output wait "60" seconds
    Then I should see "Facebook"
  #
  #Search with keyword
  #
    Given I am on "/companies"
    And I look for the output wait "60" seconds
    When I fill in "keywords" with "Facebook"
    Then I press "Update"
    And I look for the output wait "100" seconds
    Then I should see "Facebook"
  #
  #Go to company page
  #
    When I follow "Facebook"
    And I look for the output wait "60" seconds
    Then I should see "Social network"
    And I look for the output wait "60" seconds
