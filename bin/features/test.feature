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
  #Work Experience
  #
    When I click on field "#profile-contents > div > div:nth-child(3) > a"
    Then I look for the output wait "30" seconds
    And I should see "Position"
    Then I fill in "cf_studentbundle_workexperiencetype_role" with "QA"
    And I fill in "cf_studentbundle_workexperiencetype_companyName" with "IINCORE"
    When I click on field "#cf_studentbundle_workexperiencetype_fromDate"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    When I click on field "#cf_studentbundle_workexperiencetype_toDate"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    #Given I change field "input[name=cf_studentbundle_workexperiencetype[fromDate]_submit]" value with "2013/4/9"
    #Given I change field "input[name=cf_studentbundle_workexperiencetype[toDate]_submit" value with "2014/4/9"
    Then I fill in "cf_studentbundle_workexperiencetype_roleDescription" with "testing"
    And I fill in "cf_studentbundle_workexperiencetype_skills" with "HTML"
    Then I click on field "#profile-contents button.btn.btn-primary.btn-save"
    Then I look for the output wait "30" seconds

