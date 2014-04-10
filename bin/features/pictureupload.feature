Feature: Profile pic upload
  In order to upload my profile pic on collegefeed
  As a student
  I need to login to the collegefeed

  Background:
# Setup any feature dependencies

  @javascript
  Scenario: Upload profile pic in profile
    Given I am logged in as "lakshana" and "collegefeed"
    And I should see "Lakshana Pant"
    Given I am on "/profile/lakshana"
    And I should see "Public profile"

    #
    # Upload image
    #

    When I click on field "#change-photo-btn"
    Then I look for the output wait "180" seconds
    Then I look for the output wait "60" seconds

#    Given I remove class "hidden" from field "#cf_studentbundle_profilephototype_file"
#    When I attach the file "1.png" to "cf_studentbundle_profilephototype_file"
#    Given I add class "hidden" to field "#cf_studentbundle_profilephototype_file"
#    Given I submit the form "upload-profile-photo"
#    Then I look for the output wait "60" seconds