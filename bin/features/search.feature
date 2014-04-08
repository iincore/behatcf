Feature: Wiki search
  In order to find modules on Drupal.org
  As a Drupal user
  I need to be able to use Drupal.org search

  @javascript
  Scenario: Searching for a page with autocompletion
    Given I am on "/wiki/Main_Page"
    When I fill in "search" with "Behavior Driv"
    And I wait for the suggestion box to appear
    Then I should see "Behavior-driven development"
