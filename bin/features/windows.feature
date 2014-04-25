Feature: collegefeed auth
  In order to check auth collegefeed
  As a student, employer, admin
  We need to check different pages

  Background:

  @javascript
  Scenario:Now the user is at admin dashboard
    Given I am logged in as "{username}" and "{password}"
    And I am on "/admin/advancedsearch/"
    Then I set value in "keywords" with "3"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "Lakshana Pant"

    When I follow "view-full-profile"
    Then I look for the output wait "60" seconds
    Given I switch to popup
    Then I look for the output wait "60" seconds
    When I should see "Lakshana"
    Then I switch back to original window



