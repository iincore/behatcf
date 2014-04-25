Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill All the sections in the page
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Dashboard"
    When I follow "upload-resume"
    And I look for the output wait "200" seconds
    Then I should see "Please upload your latest resume"
    When I attach the file "C:\Users\Dell Laptop\Downloads\HadiKasab.pdf" to "resume"
    And I look for the output wait "100" seconds
    When I press "resume_submit"
    And I look for the output wait "200" seconds
    Then I should see "Your resume contents has been imported. Have a look and make sure everything's in the right place!"