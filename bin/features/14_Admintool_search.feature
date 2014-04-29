Feature: collegefeed Admin tool
All searching criterias
a.Search with date (date search is default for all search criterias)
b.Search with Name
c.Search With Profile percentage MORE Then
d.Search with categories
e.Search with bar
f.Search with Intern/Fulltime
g.Search with Connect status
h.Search with Created/Updated
  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Admin page to search for records
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/admin/advancedsearch/"
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    And I fill in "name" with "{admin_name}"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "{admin_name}"
  #
  #search and verify Profile percentage MORE Then
  #
    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    And I fill in "pcp" with "26"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    #Then I assert admin search field "Profile Percentage More" value "80"

  #
  #Search with categories
  #
    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    # Select software engineering bucket with value (value of SE is"646")
    When I select "646" from "bucket"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
  #
  #Search with bar
  #

    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    #Value of Highbar is 1
    When I select "1" from "bar"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
  #
  #Search with Intern/Fulltime
  #
    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    #value of Fulltime is 4
    When I select "4" from "intern"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
  #
  #Search with Connect status
  #
    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
  #value connect status "Accecpted" is "2"
    When I select "2" from "connect"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
  #
  #Search with Created/Updated
  #
    Given I am on "/admin/advancedsearch/"
    Then I look for the output wait "30" seconds
    When I fill in "fromDate" with "{admin_from_date}"
    And I fill in "toDate" with "{admin_to_date}"
    When I select "Updated" from "status"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
