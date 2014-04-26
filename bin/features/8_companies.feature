Feature: Companies page
  In order to search for the companies page student checks with companies page
  a.search using company name
  b.search with keyword for a company
  c.go to desired company page

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at companies page and searches for a desired company
    Given I am logged in as "{username}" and "{password}"
    Then I should see "Dashboard"
    Then I look for the output wait "30" seconds

  #
  #Search with company
  #
    When I follow "Companies"
    Then I look for the output wait "30" seconds
    Then I should see "Companies on collegefeed"
    And I fill in "company" with "Facebook"
    Then I press "Update"
    And I look for the output wait "100" seconds
    Then I should see "Facebook"
    When I click on the element with xpath "//div[2]/div[2]/div[2]/div/div[3]/div/div/div/a[2]"
    And I look for the output wait "60" seconds
    Then I should see "Unfollow Facebook"
    When I click on the element with xpath "//div[2]/div[2]/div[2]/div/div[3]/div/div/div/a[2]"
    And I look for the output wait "60" seconds
    Then I should see "Facebook"
  #
  #Search with keyword
  #
    Given I am on "/companies"
    And I look for the output wait "60" seconds
    When I fill in "keywords" with "Facebook"
    Then I press "Update"
    And I look for the output wait "100" seconds
    Then I should see "Facebook"
  #
  #Go to company page
  #
    When I follow "Facebook"
    And I look for the output wait "60" seconds
    Then I should see "Social network"
    And I look for the output wait "60" seconds
