Feature: dashboard feature
  In order check with the collegefeed profile
  As a student
  I need to login in as a student role in to the collegefeed and i need to access the dashboard

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at dash board to see the updates of collegefeed
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"

  #
  #Header Menu
  #
      When I follow "Profile"
      Then I should see "public profile"
      When I follow "Companies"
      Then I should see "Companies on collegefeed"
      When I follow "Jobs"
      Then I should see "Jobs on collegefeed"
      When I follow "Interview Notes"
      Then I should see "Filter Results"
      When I follow "Dashboard"
      And I look for the output wait "60" seconds
      Then I should see "Your profile"
  #
  #All Links in Dashboard
  #
      When I follow "Edit your public profile"
      Then I should see "public profile"
      When I follow "Dashboard"
      Then I should see "Your profile"
  #
  #Verifying link public profile URL
  #
      When I follow "http://ec2-54-224-48-21.compute-1.amazonaws.com/profile/"
      Then I should see "public profile"
      When I follow "Dashboard"
      And I look for the output wait "60" seconds
      Then I should see "Your profile"
  #
  #Link to Upload resume
  #
      When I click on field "#upload-resume"
      And I look for the output wait "80" seconds
      Then I should see "Please upload your latest resume"
      When I press "close-upload"
      And I look for the output wait "30" seconds
      Then I should see "Your profile"
  #
  #Link to Upcomeing event
  #
      When I follow "Get Invited"
      And I look for the output wait "30" seconds
      Then I should see "Upcoming Events"
      When I move backward one page
      Then I should see "Your profile"
      And I look for the output wait "30" seconds
  #
  #Link to Follow company
  #
#    When I click on the element with xpath "//div[3]/div/div/div/div[2]/div[2]/div[4]/div[2]/div/a"
#    And I look for the output wait "60" seconds
#    When I click on the element with xpath "/html/body/div[3]/div/div/div/div[2]/div[2]/div[4]/div[2]/div[10]/a"
#    And I look for the output wait "60" seconds
#    Then I should see "Companies on collegefeed"
#    When I follow "Dashboard"
#    And I look for the output wait "60" seconds
#    Then I should see "Your profile"
  #
  #Link to Interesting collegefeeders
  #
    When I follow "Medha"
    Then I should see "Medha Ghatikesh"
    When I move backward one page
    When I follow "Tanner"
    Then I should see "Tanner Wingo"
    When I move backward one page
    When I follow "Crystal"
    Then I should see "Crystal Chen"
    When I move backward one page
    When I follow "Cameron J"
    Then I should see "Cameron J Roe"
    When I move backward one page
    When I follow "Sisun"
    Then I should see "Sisun Lee"
    When I move backward one page
    When I follow "Jacqueline"
    Then I should see "Jacqueline Fuhrman"
    When I move backward one page
    Then I should see "Your profile"
  #
  #Link to Recommended Jobs from Across the Web
  #
    When I follow "For your Interest areas"
    Then I follow "In Companies you are following"
    And  I should see "following"

