Feature: collegefeed Admin tool
Search with user id

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Settings page "Account Settings"
    Given I am logged in as "lakshana" and "collegefeed"
    When I should see "Dashboard"
    And I am on "/admin/advancedsearch/"
    Then I set value in "keywords" with "3"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "Lakshana Pant"
  #
  #verifying the the user profile i.e "View Profile"
  #
    When I follow "view-full-profile"
    Then I look for the output wait "60" seconds
    Given I switch to popup
    Then I look for the output wait "60" seconds
    When I should see "Lakshana"
    Then I switch back to original window
  #
  #change the connect status of a user
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div/button[2]"
    Then I follow "Accepted"
    Then I look for the output wait "60" seconds
    And I should see "Congratulations. You Are Approved for collegefeed connect"
    Then I press "×"
  #
  #send message to a user
  #

    When I press "Send Message"
    Then I follow "Accepted"
    Then I look for the output wait "60" seconds
    And I should see "Congratulations. You Are Approved for collegefeed connect"
    Then I press "submit-message"
    Then I look for the output wait "30" seconds
    And I should see "Message Sent!"
    Then I press "close-contact"
  #
  #Edit Categories
  #
    When I follow "Edit Categories"
    And I look for the output wait "30" seconds
    Then I should see "Edit Bucket Information"
  #Here the user clicks on the text box using xpath #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[4]/form/div/p/div/ul"
  #Here the user selects the buckets name using xpath #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[4]/form/div/p/div/div/ul/li[3]"
    And I press "save_ajax_id1"
    Then I look for the output wait "30" seconds
    Then I should see "Software Engineering"
  #
  #Edit Bulltets i.e Notes for a profile
  #
    When I follow "Edit Categories"
    And I look for the output wait "30" seconds
    Then I should see "Edit Bullets"
    When I switch to iframe ""

  #
  #Update Fulltime and Intern status
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div[4]/button[2]"
    Then I look for the output wait "30" seconds
    When I follow "Full Time"
    And I look for the output wait "60" seconds
    When I check text "Full Time" in the element with xpath "//*[@id='studentInfo']/div/div[2]/div[2]/div[4]/button[1]"
  #
  #Update Bar status
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div[5]/button[2]"
    Then I look for the output wait "30" seconds
    When I follow "High Bar"
    And I look for the output wait "30" seconds




