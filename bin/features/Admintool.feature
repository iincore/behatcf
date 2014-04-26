Feature: Admin tool
  In order to View users on collegefeed
  As a admin
  I need to be able to go collegefeed admin

  @javascript
  Scenario: View users list
    Given I am logged in as "{username}" and "{password}"
    And I am on "/admin/advancedsearch/"
    Then I set value in "keywords" with "3"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "Lakshana Pant"






