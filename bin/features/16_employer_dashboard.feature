Feature: collegefeed Employer Dashboard
All searching Criterias
  a.Search with Keyword
  b.Search with All Categories
  c.Search with School
  d.Search with Major
  e.Search with Degree
  f.Search for Graduated
  g.Search for Graduating_Next
  h.Search for Graduating_Later
  i.Search with name

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
    When I fill in "keywords" with "java"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search with All Categories
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I select "Software Engineering" from "category-filter"
    Then I look for the output wait "60" seconds
#
#Search with School
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "school" with "Stanford University (CA)"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search with Major
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "major" with "Computer Science"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search with Degree
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "degree" with "BS"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search for Graduated
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    And I check "availability_now"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search for Graduating_Next
#
    When I click on field "#toggle-advanced"
    And I check "international"
    And I check "availability_next"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search for Graduating_Later
#
    When I click on field "#toggle-advanced"
    And I check "international"
    And I check "availability_not"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds
#
#Search with name
#
    Given I am on "/employer/search"
    Then I look for the output wait "30" seconds
    When I click on field "#toggle-advanced"
    And I check "international"
    When I fill in "name" with "kishore"
    When I click on field "#search-icon"
    Then I look for the output wait "60" seconds













