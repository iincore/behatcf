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
  #About Me
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
    When I click on field "#profile-contents > div > div:nth-child(2) a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Project Title"
    When I click on field "#profile-contents > div > div:nth-child(2) a.btn-link.delete-btn"
    Then I look for the output wait "60" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
  #
  #Work Experience
  #
    When I click on field "#profile-contents > div > div:nth-child(3) a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Position"
    Then I click on field "#profile-contents > div > div:nth-child(3) a.btn-link.delete-btn"
    Then I look for the output wait "30" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
  #
  #Accomplishments
  #
    When I click on field "#profile-contents > div > div:nth-child(4) a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Name"
    Then I click on field "#profile-contents > div > div:nth-child(4) a.btn-link.delete-btn"
    Then I look for the output wait "30" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
  #
  #My top classes
  #
    When I click on field "div#top-classes-section.row a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Course Name"
    When I click on field "div#top-classes-section.row a.btn-link delete-btn"
    Then I look for the output wait "30" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
  #
  #Education
  #
    When I click on field "#profile-contents > div > div:nth-child(6) a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "University"
    Then I click on field "#profile-contents > div > div:nth-child(6) a.btn-link delete-btn"
    Then I look for the output wait "60" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
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





