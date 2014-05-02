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
      When I follow "Edit Profile"
      Then I should see "public profile"
      When I follow "Dashboard"
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
  #Link to Recommended Jobs from Across the Web
  #
    When I follow "For your Interest areas"
    Then I follow "In Companies you are following"


