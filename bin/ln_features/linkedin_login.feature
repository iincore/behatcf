Feature: linkedin login
  In order to access my connections on linkedin

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Start linkedin crawling as logged in user
#    Given I am logged in as "{username}" and "{password}"
    Given I am on "/"
    And I should see "join"
#    Then I am on "/pub/long-chen/1a/1/8a1"
#    Then I am on "/connections?type=combined&trk=nav_responsive_tab_network"
    When I start crawling

#    And I should see "Connections"