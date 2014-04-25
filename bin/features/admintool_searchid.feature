Feature: collegefeed Admin tool
Search with user id

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Settings page "Account Settings"
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/admin/advancedsearch/"
    Then I set value in "keywords" with "3"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "Lakshana Pant"
  #
  #Update Fulltime and Intern status
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div[4]/button[2]"
    Then I look for the output wait "30" seconds
    When I follow "Full Time"
    And I look for the output wait "30" seconds
  #
  #Update Bar status
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div[5]/button[2]"
    Then I look for the output wait "30" seconds
    When I follow "High Bar"
    And I look for the output wait "30" seconds




