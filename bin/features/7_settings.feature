Feature: update settings of the user
  Updateing student Profile and Account settings

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Settings page "Account Settings"
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"
    When I click on the element with xpath "//div/div/div/div[2]/div/div/div[2]/button"
    And I follow "Settings"
    And I look for the output wait "30" seconds
    Then I should see "Account Settings"
   #
   #Edit Name
   #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr/td[3]/a"
    And I look for the output wait "30" seconds
    Then I fill in "cf_info_name_type_firstName" with "Lakshana"
    And I fill in "cf_info_name_type_lastName" with "Pant"
    And I look for the output wait "30" seconds
    Then I press "Save"
    And I look for the output wait "30" seconds
    Then I should see "Your settings have been saved."
   #
   #Edit User Name
   #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr[2]/td[3]/a"
    And I look for the output wait "30" seconds
    Then I fill in "cf_user_change_username_username" with "lakshana"
    And I look for the output wait "30" seconds
    Then I press "Save"
    And I look for the output wait "60" seconds
    Then I should see "Your settings have been saved."
   #
   #Edit Password
   #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr[3]/td[3]/a"
    Then I look for the output wait "20" seconds
    Then I fill in "fos_user_change_password_form_new_first" with "iincore"
    And I fill in "fos_user_change_password_form_new_second" with "iincore"
    Then I press "Save"
    And I look for the output wait "30" seconds
    Then I should see "Your settings have been saved."
  #
  #Edit Current and Desired location
  #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr[4]/td[3]/a"
    Then I look for the output wait "20" seconds
    Then I fill in "cf_studentbundle_locationstype_current_location" with "Santa Clara, CA, United States"
    When I click on field "div.pac-container > div:nth-child(1)"
    And I fill in "add-location" with "Mountain View, CA, United States "
    When I click on field "div.pac-container > div:nth-child(1)"
    And I look for the output wait "30" seconds
    Then I press "Save"
    And I look for the output wait "60" seconds
    Then I should see "Your settings have been saved."
  #
  #Edit Availablity
  #
    When I click on the element with xpath "//div[2]/div/div[2]/div/div/table/tbody/tr[5]/td[3]/a"
    Then I look for the output wait "20" seconds
    When I check "cf_studentbundle_availabilitytype_availability_0"
    Then I press "Save"
    And I look for the output wait "60" seconds
    Then I should see "Actively Looking"
  #
  # Now user is at "Profile settings"
  #
    When I click on the element with xpath "//div[2]/div/div/ul/li[2]/a"
    Then I fill in "cf_studentbundle_infotype_firstName" with "Lakshana"
    And I fill in "cf_studentbundle_infotype_lastName" with "Pant"
    Then I fill in "cf_studentbundle_infotype_phoneNumber" with "1234567898"
    When I select "1" from "cf_studentbundle_infotype_gender"
    And I select "4" from "cf_studentbundle_infotype_visaStatus"
    And I select "5" from "cf_studentbundle_infotype_nationality"
    And I select "8" from "cf_studentbundle_infotype_ethnicity"
    And I look for the output wait "10" seconds
    Then I fill in "cf_studentbundle_infotype_interest1" with "Testdata"
    And I fill in "cf_studentbundle_infotype_interest2" with "Behat"
    And I fill in "cf_studentbundle_infotype_interest3" with "Oracle"
    Then I press "Save"
    And I look for the output wait "30" seconds
    Then I should see "Your settings have been saved."
