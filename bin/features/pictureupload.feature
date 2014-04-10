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
