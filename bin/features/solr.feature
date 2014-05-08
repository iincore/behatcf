Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill About me

    Given I am on "http://ec2-54-227-205-94.compute-1.amazonaws.com:8080/solr/#/cf_profile_core/query"
    And I should see "Request-Handler (qt)"
    When I set value in "#q" with "i_name:kishore"
    When I press "Execute Query"
    Then I look for the output wait "60" seconds
    And I should see "kishore"

    Given I am logged in as "{username}" and "{password}"
    When I should see "Dashboard"
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "name" with "kishore"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "kishore"




