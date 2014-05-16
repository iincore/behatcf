Feature: collegefeed Admin tool
Search with user id and update
  a.Verifying view full profile
  b.Update the connect status
  c.Send message to the user
  d.Update and verify FullTime/Intern status
  e.Update and verify Highbar/Midbar
  f.Add a bucket to a profile
  g.Add notes to a profile
  h.Verifying the connect status and email sent under right pane in Admintool

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at Admin page for a profile to update
    Given I am logged in as "{username}" and "{password}"
    When I should see "Dashboard"
    And I am on "/admin/advancedsearch/"
    When I fill in "keywords" with "{admin_id}"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "{admin_name}"
  #
  #verifying the the user profile i.e "View Profile"
  #
    When I follow "view-full-profile"
    Then I look for the output wait "30" seconds
    Given I switch to popup
    Then I look for the output wait "30" seconds
    When I should see "{admin_name}"
    Then I switch back to original window
  #
  #change the connect status of a user
  #
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div/button[2]"
    Then I follow "Accepted"
    Then I look for the output wait "30" seconds
    And I should see "Send message"
    # Then close the popup window with css#
    Given I click on field "div#contactModal.modal button.close"
    Then I look for the output wait "30" seconds
  #
  #send message to a user
  #

    When I follow "Send Message"
    Then I follow "send-connect-message-2"
    Then I look for the output wait "60" seconds
    And I should see "Send message"
    Then I press "submit-message"
    Then I look for the output wait "60" seconds
    And I should see "Message Sent!"
    Then I look for the output wait "30" seconds
    Then I press "close-contact"
    And I look for the output wait "30" seconds
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
    When I check text "High Bar" in the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[2]/div[5]/button"
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
    Then I look for the output wait "60" seconds
    When I check text "Software Engineering" in the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[3]/div"
    Then I look for the output wait "30" seconds
  #
  #Edit Bulltets i.e Notes for a profile
  #

    When I follow "Edit Bullets"
    Then I should see "Edit Bullets"
    When I switch to iframe "cke_s_text_id"
    When I set value in using "body" tag with "testing"
    Then I switch back from iframe
    # then click on the save button to save notes#
    When I click on the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[5]/form/div[2]/input"
    Then I look for the output wait "60" seconds
    When I check text "testing" in the element with xpath "//div[2]/div/div/div/div[3]/div/div/div/div[2]/div[4]/div/div"
    Then I look for the output wait "30" seconds

  #
  #Verifying the connect status and email sent under right pane in Admintool
  #
    Given I am on "/admin/advancedsearch/"
    When I fill in "keywords" with "{admin_id}"
    And I click on field "img#search-icon"
    Then I look for the output wait "60" seconds
    And I should see "{admin_name}"
    When I check text "Accepted" in the element with xpath "//div[2]/div/div/div/div[2]/div[2]/table/tbody/tr/td[2]/span"
    And I follow "Emailed"
    Then I look for the output wait "60" seconds
    Then I should see " Type : Accepted"











