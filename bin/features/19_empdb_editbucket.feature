Feature: collegefeed Employer Dashboard
  Bucket name update
  delete bucket


  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Employer dashboard to search for records
    Search with keyword
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/employer/search"
    When I follow "Saved"
    And I should see "Saved Profiles"
    When I click on field "#my-categories"
    Then I look for the output wait "30" seconds
    And I should see "{emp_bucketname}"
    When I select "{emp_bucketname}" from "my-categories"
    Then I look for the output wait "30" seconds
    And I should see "{emp_name}"
    Then I look for the output wait "30" seconds
    When I press "edit-category"
    Then I look for the output wait "30" seconds
    And I should see "Edit Category"
    When I fill in "cf_employerbundle_bucketstype_name" with "{emp_bucketname}"
    And I press "save-category"
    Then I look for the output wait "30" seconds








