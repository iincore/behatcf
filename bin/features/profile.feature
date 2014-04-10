Feature: collegefeed login
  In order to access my profile on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill All the sections in the page
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Lakshana Pant"
    Given I am on "/profile/lakshana"
    And I should see "Public profile"

  #
  #About
  #
    When I click on field "#profile-contents > div > div:nth-child(1) > a.edit-section"
    Then I look for the output wait "30" seconds
    And  I should see "Describe yourself in one line"
    Then I fill in "cf_studentbundle_infoaboutmetype_description" with "QAtest"
    And I fill in "cf_studentbundle_infoaboutmetype_bio" with "I am a QA Engineer"
    When I fill in "cf_studentbundle_infoaboutmetype_tags" with "HTML"
    When I click on field "#profile-contents > div > div:nth-child(1) button.btn-save"
    And I look for the output wait "60" seconds
  #
  #Work samples
  #
    When I click on field "#profile-contents > div > div:nth-child(2) > a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "Project Title"
    Then I fill in "cf_studentbundle_portfoliotype_title" with "Test"
    And I fill in "cf_studentbundle_portfoliotype_skill" with "Selenium"
    Then I fill in "cf_studentbundle_portfoliotype_description" with "testing"
    And I fill in "cf_studentbundle_portfoliotype_sample" with "www.test.com"
    When I click on field "#profile-contents > div > div:nth-child(2) button.btn-save"
    Then I look for the output wait "60" seconds
  #
  #Work Experience
  #
    When I click on field "#profile-contents > div > div:nth-child(3) > a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "Position"
    Then I fill in "cf_studentbundle_workexperiencetype_role" with "QA"
    And I fill in "cf_studentbundle_workexperiencetype_companyName" with "IINCORE"
    When I click on field "#cf_studentbundle_workexperiencetype_fromDate"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    When I click on field "#cf_studentbundle_workexperiencetype_toDate"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    Then I fill in "cf_studentbundle_workexperiencetype_roleDescription" with "testing"
    And I fill in "cf_studentbundle_workexperiencetype_skills" with "HTML"
    Then I click on field "#profile-contents > div > div:nth-child(3) button.btn.btn-primary.btn-save"
    Then I look for the output wait "30" seconds
  #
  #accomplishments
  #
    When I click on field "#profile-contents > div > div:nth-child(4) > a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "Name"
    Then I fill in "cf_studentbundle_accomplishmentstype_name" with "Lakshana"
    And I fill in "cf_studentbundle_accomplishmentstype_description" with "Testing"
    When I click on field "#cf_studentbundle_accomplishmentstype_date"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    Then I fill in "cf_studentbundle_accomplishmentstype_instititution" with "IINCORE"
    Then I click on field "#profile-contents > div > div:nth-child(4) button.btn.btn-primary.btn-save"
    Then I look for the output wait "30" seconds
  #
  #My top classes
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
    When I click on field "div#top-classes-section.row div.add-row div.content div.text-left button.btn"
    Then I look for the output wait "30" seconds
  #
  #Education
  #
    When I click on field "#profile-contents > div > div:nth-child(6) > a.add-section"
    Then I look for the output wait "30" seconds
    And I should see "University"
    When I set value in "cf_studentbundle_academicrecordtype_university" with "Behat University"
    And I fill in "cf_studentbundle_academicrecordtype_department2" with "Mink"
    Then I fill in "cf_studentbundle_academicrecordtype_program" with "BS"
    And I fill in "cf_studentbundle_academicrecordtype_major" with "Computer Science"
    Then I fill in "cf_studentbundle_academicrecordtype_graduation_year" with "2008"
    And I fill in "cf_studentbundle_academicrecordtype_gpa" with "4"
    Then I click on field "#profile-contents > div > div:nth-child(6) button.btn-save"
    Then I look for the output wait "60" seconds
  #
  #Personal statement
  #
    When I click on field "#profile-contents > div > div:nth-child(7) > a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Essay"
    Then I fill in "cf_studentbundle_statementtype_essay" with "test testing"
    And I fill in "cf_studentbundle_statementtype_video" with "http://www.testing.com"
    When I click on field "#profile-contents > div > div:nth-child(7) button.btn.btn-primary.btn-save"
    Then I look for the output wait "60" seconds
  #
  #Top 3 companies
  #
    When I click on field "#profile-contents > div > div:nth-child(8) > a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Company 1"
    Then I fill in "cf_studentbundle_infotype_company1" with "Google"
    And I fill in "cf_studentbundle_infotype_company2" with "Collegefeed"
    Then I fill in "cf_studentbundle_infotype_company3" with "Infosys"
    When I click on field "#profile-contents > div > div:nth-child(8) button.btn.btn-primary.btn-save"
    Then I look for the output wait "60" seconds



