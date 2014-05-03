Feature: dashboard feature
In order to check with all the links in the home page

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Homepage to access all the links in homepage
    Given I am on "http://ec2-54-224-48-21.compute-1.amazonaws.com/"
    Then I should see "Get Jobs Faster Through Insider Connections"
  #
  #Header Menu on Homepage
  #
      When I follow "Employers"
      Then I should see "Discover and Attract Awesome College Talent"
      When I follow "About Us"
      Then I should see "Founders"
      When I follow "Career Centers"
      Then I should see "Maximize Opportunities For Your Students / Alumni"
      When I follow "Students"
      Then I should see "Get Jobs Faster Through Insider Connections"
      Then I look for the output wait "30" seconds
  #
  #All Links to Articles
  #

  #Link to CNBC Article
    When I click on field "#news-row > span > a:nth-child(1) img"
    Then I look for the output wait "60" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "CNBC: BREAKTHROUGH: How collegefeed is helping college grads find jobs"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"

  #Link to WSJ Article
    When I click on field "#news-row > span > a:nth-child(2) img"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Interview Suit: Here Comes the Virtual Career Fair"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
  #Link to Forbes Article
    When I click on field "#news-row > span > a:nth-child(3) img"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I follow "Continue to Site »"
    When I should see "If Your Resume Isn't Prevailing, These Startups Want To Help"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
  #Link to USA Today Article
    When I click on field "#news-row > span > a:nth-child(4) img"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Change Agents: Sanjeev Agrawal's collegiate job quest"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
  #Link to Tech crunch  Article
    When I click on field "#news-row > span > a:nth-child(5) img"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Collegefeed Raises $1.8M From Accel Partners For Data-Driven Platform That Connects Students And Employers"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
  #Link to Newyork Times Article
    When I click on field "#news-row > span > a:nth-child(6) img"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Matchmaker, Matchmaker, Find Me a Job"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
#
#Links to social networking pages
#
  #Link to Facebook
    When I follow "Follow on Facebook"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Collegefeed is a social platform that makes it very easy and engaging for college grads"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
  #Link to Twitter
    When I follow "Twitter"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Collegefeed is a social platform that makes it very easy"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
  #Link to LinkedIn
    When I follow "LinkedIn"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Join LinkedIn and see how you are connected to Collegefeed. It's free."
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
  #Link to Goolge
    When I follow "Google"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "Share the right things with just the right people."
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds
  #Link to Pinterest
    When I follow "Pinterest"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "collegefeed is an early career marketplace that helps college students"
    Then I switch back to original window
    Then I should see "Get Jobs Faster Through Insider Connections"
    Then I look for the output wait "30" seconds


#
#Footer Menu on Homepage "Collegefeed menu"
#
    When I follow "Team / Investors"
    Then I should see "Founders"
    When I follow "Mission"
    Then I should see "To make it dead simple for students and early grads to kickstart their careers."
    When I follow "News"
    Then I should see "News"
    When I follow "Office"
    Then I should see "Mountain View, USA"
    When I follow "Contact Us"
    Then I should see "Reason for contacting"
    When I follow "Contact Us"
    Then I should see "Reason for contacting"
#
#Students Menu
#
    When I follow "Private Networking Events"
    Then I should see "Upcoming Events"
    When I follow "Employer Network"
    Then I should see "Companies on collegefeed"
    When I follow "Hall of Fame"
    Then I should see "Below are some collegefeeders"
    When I follow "Become an Ambassador!"
    Then I should see "Make a difference"
    When I follow "Jobs"
    Then I should see "Login"
    When I move backward one page
#
#Blog Menu
#
    When I follow "Not Getting a Job?"
    Then I should see "5 Reasons You’re Not Getting a Job"
    When I move backward one page
    And I follow "Daydream First"
    Then I should see "Looking for a Job? Daydream First"
    When I move backward one page
    And I follow "Q&A - Kathleen Cardozo"
    Then I should see "Expert Q&A with Recruiter Kathleen Cardozo"
    When I move backward one page
    And I follow "You Can’t Be Stopped"
    Then I should see "You Can Be Rejected, But You Can’t Be Stopped"
    When I move backward one page
#
#Legal Menu
#
    When I follow "Terms of Service"
    Then I should see "These Terms of Service define the terms by which you may use www.collegefeed.com"
    When I follow "Privacy Policy"
    Then I should see "PLEASE READ THIS PRIVACY POLICY CAREFULLY BEFORE USING THIS WEBSITE OR OUR SERVICES."
    When I follow "Award Rules"
    Then I should see "Official Monthly Awards Rules"
#
#Employers link
#
    When I follow "Request Beta Access"
    Then I should see "Discover and Attract Awesome College Talent"
#
#Career Centers
#
    When I follow "Partner With Us"
    Then I should see "Maximize Opportunities For Your Students / Alumni"










