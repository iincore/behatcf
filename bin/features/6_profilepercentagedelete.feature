Feature: public profile records delete
 This is the delete feature of the public profile
 on accessing this feature user is able to delete unnecessary records in the public profile

  a.Delete worksamples              4pts      Profile Completion: 94%
  b.Delete work exp                10pts      Profile Completion: 84%
  c.Delete accomplishments         15pts      Profile Completion: 69%
  d.Delete top classes              3pts      Profile Completion: 66%
  f.Delete Education               14pts      Profile Completion: 52%

  Background:
# Setup any feature dependencies

#@javascript

  @javascript
  Scenario:Now the user is at pubile profile to fill All the sections in the page
    Given I am logged in as "{username}" and "{password}"
    And I should see "Dashboard"
    When I follow "Profile"
    Then I should see "Public profile"

  #
  #Work samples
  #
    When I click on field "#profile-contents > div > div:nth-child(2) a.edit-section"
    Then I look for the output wait "30" seconds
    And I should see "Project Title"
    When I click on field "#profile-contents > div > div:nth-child(2) a.btn-link.delete-btn"
    Then I look for the output wait "30" seconds
    When I click on field "#deleteModal a.confirm-delete"
    Then I look for the output wait "30" seconds
    When I follow "Dashboard"
    Then I should see "Profile Completion: 94%"
    When I move backward one page
    And I look for the output wait "60" seconds
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
    When I follow "Dashboard"
    Then I should see "Profile Completion: 84%"
    When I move backward one page
    And I look for the output wait "60" seconds
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
    When I follow "Dashboard"
    Then I should see "Profile Completion: 69%"
    When I move backward one page
    And I look for the output wait "60" seconds
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
    When I follow "Dashboard"
    Then I should see "Profile Completion: 66%"
    When I move backward one page
    And I look for the output wait "60" seconds
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
    When I follow "Dashboard"
    Then I should see "Profile Completion: 52%"
    When I move backward one page
    And I look for the output wait "60" seconds





