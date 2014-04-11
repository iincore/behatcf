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
    And I should see "Lakshana Pant"
    Given I am on "/profile/lakshana"
    And I should see "Public profile"

  #
  #Edit Name
  #
    When I click on field "#edit-name-btn"
    Then I look for the output wait "30" seconds
    Then I fill in "cf_info_name_type_firstName" with "Lakshana"
    And I fill in "cf_info_name_type_lastName" with "Pant"
    When I click on field "#edit-name-inline > button.btn-save"
    And I look for the output wait "60" seconds
