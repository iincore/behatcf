Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Settings page "Account Settings"
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Dashboard"
    When I click on the element with xpath "//div/div/div/div[2]/div/div/div[2]/button"
    And I follow "Settings"
    And I look for the output wait "30" seconds
    Then I should see "Account Settings"
  #
  #Edit Current and Desired location
  #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[3]/a"
    Then I look for the output wait "20" seconds
    Then I fill in "cf_studentbundle_locationstype_current_location" with "Santa Clara, CA, United States"
    And I look for the output wait "30" seconds
    Then I press "Save"
    And I look for the output wait "60" seconds
  #
  #Check db is location updated
  #
    Given I exec query "select * from cf_profile_settings a Join cf_user u on a.owner_id = u.id where u.username = 'lakshana' and current_location like '%Santa Clara%'" on db throw exception "location is not set properly"
    And I look for the output wait "30" seconds



