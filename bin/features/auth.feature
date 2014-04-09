Feature: collegefeed auth
  In order to check auth collegefeed
  As a student, employer, admin
  We need to check different pages

  Background:

  @javascript
  Scenario:Now the user is at admin dashboard
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Lakshana Pant"
    Given I am on "/admin/advancedsearch/"
    And I should see "Auto Dispose"



