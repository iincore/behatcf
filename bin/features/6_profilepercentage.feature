Feature: public profile update
  In order to update the public profile user need to access public profile
  and updates all the sections of profile for 100 points
  By default the profile percentage is 19%
  a.Add name                                 3 pts  profile percentage is 22%
  b.Add About me                             5 pts  profile percentage is 27%
  c.Add 1 work samples and 1 work exp       14 pts  profile percentage is 41%
  d.Add 1 accomplishments                   14 pts  profile percentage is 55%
  Here add 2 top classes to get 14 pts
  e.Add 1st top class                       11 pts  profile percentage is 66%
  f.Add 2nd top class                        3 pts  profile percentage is 69%
  g.Add personal stmt                       15 pts  profile percentage is 84%
  h.Add refrences                           14 pts  profile percentage is 98%
  i.Add Image                                2 pts  profile percentage is 100%
  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill All the sections in the page
    Given I am logged in as "{username}" and "{password}"
    And I should see "Profile Completion: 19%"
    When I follow "Profile"
    Then I should see "Public profile"
    And I look for the output wait "30" seconds
  #
  #Edit Name
  #
    When I click on field "#edit-name-btn"
    Then I look for the output wait "30" seconds
    Then I fill in "cf_info_name_type_firstName" with "{first_name}"
    And I fill in "cf_info_name_type_lastName" with "{last_name}"
    When I click on field "#edit-name-inline > button.btn-save"
    And I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 22%"
    When I move backward one page
    And I look for the output wait "30" seconds
  #
  #About me
  #
    When I click on field "#profile-contents > div > div:nth-child(1) > a.edit-section"
    Then I look for the output wait "30" seconds
    And  I should see "Describe yourself in one line"
    Then I fill in "cf_studentbundle_infoaboutmetype_description" with "QAtest"
    And I fill in "cf_studentbundle_infoaboutmetype_bio" with "I am a QA Engineer"
    When I fill in "cf_studentbundle_infoaboutmetype_tags" with "HTML"
    When I click on field "#profile-contents > div > div:nth-child(1) button.btn-save"
    And I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 27%"
    When I move backward one page
    And I look for the output wait "40" seconds
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
    Then I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 41%"
    When I move backward one page
    And I look for the output wait "30" seconds
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
    Then I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 55%"
    When I move backward one page
    And I look for the output wait "30" seconds

  #
  #My top classes 1 st record
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
    Then I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 66%"
    When I move backward one page
    And I look for the output wait "30" seconds
  #
  #My top classes 2 nd record
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
    Then I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 69%"
    When I move backward one page
    And I look for the output wait "60" seconds
  #
  #Personal statement
  #
    When I click on field "#profile-contents > div > div:nth-child(7) > a.edit-section"
    Then I look for the output wait "90" seconds
    And I should see "Essay"
    Then I fill in "cf_studentbundle_statementtype_essay" with "test testing"
    And I fill in "cf_studentbundle_statementtype_video" with "http://www.testing.com"
    When I click on field "#profile-contents > div > div:nth-child(7) button.btn.btn-primary.btn-save"
    Then I look for the output wait "60" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 84%"
    When I move backward one page
    And I look for the output wait "30" seconds
  #
  # Add Refrences
  #
    When I click on field "#profile-contents > div > div:nth-child(9) > a.add-section"
    Then I look for the output wait "60" seconds
    And I should see "Their Name"
    Then I fill in "cf_studentbundle_cfreferencestype_name" with "kishore"
    And I fill in "cf_studentbundle_cfreferencestype_email" with "kishore.ram@iincore.com"
    Then I fill in "cf_studentbundle_cfreferencestype_organization" with "Google"
    Then I fill in "cf_studentbundle_cfreferencestype_relationship" with "Friend"
    Then I fill in "cf_studentbundle_cfreferencestype_projectDescription" with "collegefeed"
    Then I fill in "cf_studentbundle_cfreferencestype_message" with "testing"
    When I click on field "#profile-contents > div > div:nth-child(9) > div.add-row.single-row.active-editor > div > div.text-left.save-cancel.form-buttons > button.btn.btn-primary.btn-save"
    Then I look for the output wait "60" seconds
    And I should see "awaiting response"
    When I follow "Dashboard"
    Then I should see "Profile Completion: 98%"
    When I move backward one page
    And I look for the output wait "30" seconds



