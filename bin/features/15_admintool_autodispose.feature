Feature: collegefeed Admin tool on Auto dispose

  Before running the test case run below mentioned 2 test cases

 a. 0_signup_NON-USprofile.feature
 b. 0_signup_USprofile.feature



  Here in testcase no.1

  when the user searched with all colleges only the colleges which are not under top colleges profiles should be displayed
  Here we are updating in 1 st test case location with India
  Inorder to verify when the user Autodispose the profile the status should be "Waitlist  - International"

  In testcase no.2
  when the user searched with top colleges only the top college profiles should be displayed
  we are updating in 2 nd test case location with US
  Inorder to verify when the user Autodispose the profile the status should be "Waitlist - NMI"


  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Admin page on Auto dispose to check profile percentage less then with all colleges
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/admin/advancedsearch/"
    When I follow "toggle-auto-dispose"
    Then I should see "Profiles on date"
    When I fill in "last-hours" with "04/25/2014"
    And I fill in "profile-percentage-auto-dispose" with "50"
    And I fill in "profile-top-percentage" with "-1"
    And I follow "auto-dispose-submit"
    Then I look for the output wait "60" seconds
    And I should see "Ave Maria University (FL)"
    When I check text "Profile to be reviewed" in the element with xpath "//div[2]/div/div/div/div[2]/div[2]/table/tbody/tr/td[2]/span"
    When I check text "Bangalore, Karnataka, India" in the element with xpath "//div[2]/div/div/div/div[2]/div[2]/table/tbody/tr/td[2]/div/div/span[3]"
    And I follow "send-message-4"
    Then I should see " Waitlist  - International"
  #
  #Auto dispose to check profile percentage less then with TOPcolleges
  #
    And I am on "/admin/advancedsearch/"
    When I follow "toggle-auto-dispose"
    Then I should see "Profiles on date"
    When I fill in "last-hours" with "{admin_autodispose_date}"
    And I fill in "profile-percentage-auto-dispose" with "-1"
    And I fill in "profile-top-percentage" with "33"
    And I follow "auto-dispose-submit"
    Then I look for the output wait "60" seconds
    And I should see "Stanford University (CA)"
    When I check text "Profile to be reviewed" in the element with xpath "//div[2]/div/div/div/div[2]/div[2]/table/tbody/tr/td[2]/span"
    When I check text "Bangalore, Karnataka, India" in the element with xpath "//div[2]/div/div/div/div[2]/div[2]/table/tbody/tr/td[2]/div/div/span[3]"
    And I follow "send-message-4"
    Then I should see "Waitlist - NMI"

