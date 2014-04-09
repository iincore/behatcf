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
    Given I am on "/profile/lakshana"
    And I should see "Public profile"
   #
   #Top 3 classes
   #
    When I click on field "#profile-contents > div > div:nth-child(6) > a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "University"
    Then I fill in "cf_studentbundle_academicrecordtype_university" with "Behat University"
    And I fill in "cf_studentbundle_academicrecordtype_department2" with "Mink"
    Then I fill in "cf_studentbundle_academicrecordtype_program" with "BS"
    And I fill in "cf_studentbundle_academicrecordtype_major" with "Computer Science"
    Then I fill in "cf_studentbundle_academicrecordtype_graduation_year" with "2008"
    And I fill in "cf_studentbundle_academicrecordtype_gpa" with "4"
    Then I click on field "#profile-contents > div > div:nth-child(6) button.btn-save"
    Then I look for the output wait "60" seconds


#profile-contents > div > div:nth-child(6) > a.add-section