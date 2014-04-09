Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill About me
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Lakshana Pant"
    When I follow "Profile"
    And I should see "Public profile"

  #
  #Top 3 classes
  #
    When I click on field "div#top-classes-section.row a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "Course Name"
    Then I fill in "cf_studentbundle_topclassestype_name" with "Behat"
    And I fill in "cf_studentbundle_topclassestype_cid" with "3"
    Then I fill in "cf_studentbundle_topclassestype_university" with "Stanford University"
    And I fill in "cf_studentbundle_topclassestype_grade" with "A"
    Then I fill in "cf_studentbundle_topclassestype_yyfrom" with "2008"
    And I fill in "cf_studentbundle_topclassestype_description" with "testing"
    Then I fill in "cf_studentbundle_topclassestype_reason" with "Test"
    Then I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div[5]/div[2]/div/div[2]/button"
    Then I look for the output wait "30" seconds



