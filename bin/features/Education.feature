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
    When I click on field "div#profile-contents.span9 div.inner div.row a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "University"
    Then I fill in "cf_studentbundle_academicrecordtype_university" with "Stanford University"
    And I fill in "cf_studentbundle_academicrecordtype_department2" with "CSE"
    Then I fill in "cf_studentbundle_academicrecordtype_program" with "BS"
    And I fill in "cf_studentbundle_academicrecordtype_major" with "Computer Science"
    Then I fill in "cf_studentbundle_academicrecordtype_graduation_year" with "2008"
    And I fill in "cf_studentbundle_academicrecordtype_gpa" with "4"
    Then I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div[6]/div[2]/div/div[2]/button"
    Then I look for the output wait "30" seconds


