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
    When I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div/a"
    Then I look for the output wait "30" seconds
    And  I should see "Describe yourself in one line"
    Then I fill in "cf_studentbundle_infoaboutmetype_description" with "QAtest"
    And I fill in "cf_studentbundle_infoaboutmetype_bio" with "I am a QA Engineer"
    When I fill in "cf_studentbundle_infoaboutmetype_tags" with "HTML"
    Then I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div/div[3]/div[2]/button"
    And I look for the output wait "30" seconds
  #
  #Work samples
  #
    When I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div[2]/a"
    Then I look for the output wait "30" seconds
    And I should see "Project Title"
    Then I fill in "cf_studentbundle_portfoliotype_title" with "Test"
    And I fill in "cf_studentbundle_portfoliotype_skill" with "Selenium"
    Then I fill in "cf_studentbundle_portfoliotype_description" with "testing"
    And I fill in "cf_studentbundle_portfoliotype_sample" with "www.test.com"
    Then I click on the element with xpath "//div[3]/div/div/div[3]/div[2]/div/div[2]/div[2]/div/div[2]/button"
    Then I look for the output wait "30" seconds
  #
  #Work Experience
  #
    When I follow "Add work experience"
    Then I look for the output wait "30" seconds
    And I should see "Position"


