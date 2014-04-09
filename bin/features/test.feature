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
  #Work Experience
  #
    When I follow "Add work experience"
    Then I look for the output wait "30" seconds
    And I should see "Position"
    Then I fill in "cf_studentbundle_workexperiencetype_role" with "QA"
    And I fill in "cf_studentbundle_workexperiencetype_companyName" with "IINCORE"
    #When I click on field "#cf_studentbundle_workexperiencetype_fromDate"
    #When I click on field "div.pickadate__day--selected"
    #When I click on field "#cf_studentbundle_workexperiencetype_toDate"
    #When I click on field "div.pickadate__day[data-date='2014/4/9']"
    Given I change field "#cf_studentbundle_workexperiencetype_fromDate" value with "2013/4/9"
    Given I change field "#cf_studentbundle_workexperiencetype_toDate" value with "2014/4/9"
    Then I fill in "cf_studentbundle_workexperiencetype_roleDescription" with "testing"
    And I fill in "cf_studentbundle_workexperiencetype_skills" with "HTML"
    Then I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div[3]/div[2]/div/div[2]/button"
    Then I look for the output wait "30" seconds



