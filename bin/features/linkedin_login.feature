Feature: linkedin login
  In order to access my connections on linkedin

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Start linkedin crawling as logged in user
    Given I am logged in as "{username}" and "{password}"
    And I should see "Home"