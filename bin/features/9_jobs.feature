Feature: Jobs page
  In order to search for a desired job go to jobs page
  a. Search for Full time and Internship
  b. Search for Full time
  c. Search for Intern

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:User fills in all the fields in interview notes page
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"
    When I follow "Jobs"
    And I look for the output wait "80" seconds
    Then I should see "Jobs on collegefeed"
    And I look for the output wait "80" seconds
#
# Search for Fulltime and Internship
#
    When I fill in "keyword" with "software engineer"
    When I fill in "location" with "San Jose, CA"
    When I press "Search"
    And I look for the output wait "80" seconds
    And I should see "Search Results for"
#
# Search for Fulltime
#

    When I fill in "keyword" with "software engineer"
    When I fill in "location" with "San Jose, CA"
    And I uncheck "internship"
    When I press "Search"
    Then I should see "Search Results for"
#
# Search for only Internship
#
    When I fill in "keyword" with "software engineer"
    When I fill in "location" with "San Jose, CA"
    And I uncheck "fulltime"
    Then I check "internship"
    When I press "Search"
    Then I should see "Search Results for"

