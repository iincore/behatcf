Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed
  Background:
# Setup any feature dependencies
#@javascript
  @javascript
  Scenario:Now the user is at pubile profile to fill About me
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Lakshana Pant"
    When I follow "Profile"
    And I should see "Public profile"
  #
  #Personal statement
  #
    When I click on field "#profile-contents > div > div:nth-child(8) > a"
    Then I look for the output wait "30" seconds
    And I should see "Company 1"
    Then I fill in "cf_studentbundle_infotype_company1" with "Google"
    And I fill in "cf_studentbundle_infotype_company2" with "Collegefeed"
    Then I fill in "cf_studentbundle_infotype_company3" with "Infosys"
    When I click on field "#profile-contents > div > div:nth-child(8) button.btn.btn-primary.btn-save"
    Then I look for the output wait "60" seconds




