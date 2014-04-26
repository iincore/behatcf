Feature: Interview notes page
  In order to enter personal interview experiance go to interview notes page
  a.Enter user notes using "Add your own Interview Experience"
  b.Search for the submitted record

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:User fills in all the fields in interview notes page
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"
    When I follow "Interview Notes"
    And I look for the output wait "80" seconds
    When I press "Add your own Interview Experience"
    And I look for the output wait "80" seconds
    When I fill in "company" with "IINCORE"
    When I fill in "roleInterviewedFor" with "QA"
    When I fill in "round" with "3"
    When I fill in "location" with "Bangalore"
   # When I fill in "date" with ""
    When I fill in "interviewerTitle" with "QA"
    When I select "average" from "hdid"
    When I select "Pending" from "digs"
    When I fill in "salary" with "10000"
    When I fill in "higi" with "through collegefeed"
    When I fill in "hip" with "serious"
    When I fill in "questionsAsked" with "About me"
    When I fill in "tips" with "test"
    When I fill in "anythingSurprising" with "ntg"
    When I fill in "companiesIdealCandidate" with "ntg"
    When I fill in "whatWentWell" with "test"
    When I fill in "howToDoBetter" with "test"
    When I press "Submit"
    And I look for the output wait "80" seconds
    Then I should see "Thank you for your feedback!"
    When I follow "Click here to go back to Interview Notes"
    And I look for the output wait "80" seconds
    Then I should see "Filter Results"
  #
  #Search for the submitted record
  #
    When I fill in "search" with "IINCORE"
    Then I press "searchButton"
    And I look for the output wait "80" seconds
    Then I should see "records found that match your selection criteria."
    Then I follow "All Interviews"
    When I follow "My Interviews."





