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
  #accomplishments
  #
    When I click on field "#profile-contents > div > div:nth-child(4) > a"
    Then I look for the output wait "30" seconds
    And I should see "Name"
    Then I fill in "cf_studentbundle_accomplishmentstype[name]" with "Lakshana"
    And I fill in "cf_studentbundle_accomplishmentstype[description]" with "Testing"
    When I click on field "#cf_studentbundle_accomplishmentstype_date"
    When I click on field "div.pickadate__holder--opened div.pickadate__day--today"
    Then I fill in "cf_studentbundle_accomplishmentstype_instititution" with "IINCORE"
    Then I click on field "#profile-contents button.btn.btn-primary.btn-save"
    Then I look for the output wait "30" seconds

