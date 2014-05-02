Feature: collegefeed Employer Dashboard
checking with connect status


  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Employer dashboard to search for records
    Search with keyword
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "school" with "Stanford University (CA)"
    When I fill in "name" with "{emp_name}"
    When I click on field "#search-icon"
    And I look for the output wait "90" seconds
    And I should see "{emp_name}"

#
#Verifying the viewprofile
#
    When I click on the element with xpath "//div[4]/div/div/div/div/div/div/div/div/div/div[2]/a[2]"
    Then I look for the output wait "30" seconds
    And I follow "View Profile"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "{emp_name}"
    Then I switch back to original window

#
#Verifying the Contact
#
    And I follow "Contact"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    When I look for the output wait "30" seconds
    Then I should see "Your Message"
    When I switch to iframe "cke_cf_studentbundle_messagetype_message"
    When I set value in using "body" tag with "testing"
    Then I switch back from iframe
    And I press "submit-message"
    Then I look for the output wait "30" seconds
    And I should see "Message Sent!"
    Then I press "close-contact"
    And I look for the output wait "30" seconds
    Then I should see "{emp_name}"
    Then I switch back to original window












