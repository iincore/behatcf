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
#    Then I look for the output wait "30" seconds
#    When I click on field "#toggle-advanced"
#    And I check "international"
#    When I fill in "school" with "Stanford University (CA)"
#    When I fill in "name" with "{emp_name}"
#    When I click on field "#search-icon"
#    And I look for the output wait "90" seconds
#    And I should see "{emp_name}"

##
##Create a bucket
##
#    When I click on the element with xpath "//div[4]/div/div/div/div/div/div/div/div/div/div[2]/a[2]"
#    Then I look for the output wait "30" seconds
#    And I follow "snapshot-bookmark"
#    Then I look for the output wait "30" seconds
#    And I should see "Your Notes"
#    When I select "Create New Bucket" from "select-bucket"
#    When I fill in "new-bucket-name" with "testbucket"
#    Then I press "create-bucket-btn"
#    Then I look for the output wait "30" seconds
#    When I fill in "cf_employerbundle_studentnotestype_notes" with "test"
#    And I press "save-note"
#    Then I look for the output wait "30" seconds

#
#Verifying a bucket
#
    When I follow "Saved"
    And I should see "Saved Profiles"
    When I click on field "#my-categories"
    And I should see "QA test"
    When I select "QA test" from "my-categories"
    Then I look for the output wait "30" seconds


















