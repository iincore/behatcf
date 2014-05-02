Feature: upload resume
  In order to fill the user data in to collegefeed
  user will upload the resume to update public profile


  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at dashboard to upload resume
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"
    When I follow "Profile"
    Then I should see "public profile"
    When I follow "Resume"
    And I look for the output wait "200" seconds
    Then I should see "Please upload your latest resume"
    When I attach the file "C:\Users\Dell Laptop\Downloads\HadiKasab.pdf" to "resume"
    And I look for the output wait "100" seconds
    When I press "resume_submit"
    And I look for the output wait "200" seconds
    Then I should see "Your resume contents has been imported. Have a look and make sure everything's in the right place!"