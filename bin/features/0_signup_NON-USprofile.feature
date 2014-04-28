Feature: collegefeed sign up
	In order to create my profile on collegefeed
	As a student
	I need to be able to sign up to the collegefeed

 @javascript
Scenario: Sign up to collegefeed
	Given I am on "/register/"
	And I fill in "email_1click" with "{signup_email}"
	And I fill in "passwd_1click" with "{signup_password}"
	Then I press "Sign up"
    And I look for the output wait "60" seconds
	And I should see "Welcome to collegefeed!"

#
#Enter student school details
#

   When I fill in "cf_studentbundle_usernamegraduationtype_schoolRecord_university" with "Ave Maria University (FL)"
   And I look for the output wait "30" seconds
   And I fill in "cf_studentbundle_usernamegraduationtype_schoolRecord_major" with "computers"
   And I fill in "cf_studentbundle_usernamegraduationtype_schoolRecord_graduation_year" with "2012"
   And I fill in "cf_studentbundle_usernamegraduationtype_infoPhone_phoneNumber" with "1212121212"
   Then I press "Next"
   And I look for the output wait "30" seconds
   Then I should see "List three companies you'd like to work for."
#
#Enter student desired top 3 company names
#

   When I fill in "cf_studentbundle_infotype_company1" with "eBay"
   And I fill in "cf_studentbundle_infotype_company2" with "Google"
   And I fill in "cf_studentbundle_infotype_company3" with "Apple"
   Then I press "Next"
   And I look for the output wait "30" seconds
   Then I should see "What's your availability?"
#
#Enter Availability preferences of a student
#
   When I check "cf_studentbundle_locationstype_availability_0"
   And I fill in "cf_studentbundle_locationstype_current_location" with "Bangalore, Karnataka, India"
   And I look for the output wait "30" seconds
   Then I should see "Bangalore, Karnataka, India"
   And I fill in "add-location" with "Melbourne, Victoria, Australia"
   And I look for the output wait "30" seconds
   Then I should see "Melbourne VIC, Australia"
   Then I press "Next"
   And I look for the output wait "30" seconds
   Then I should see "collegefeed is an exclusive network and requires members to invite 5 friends in order to extend the benefits."
#
#Enter emails ids to invite friend to collegefeed
#
   When I fill in "form_yourname" with "kishore"
   And I fill in "form_friendemail1" with "test1@email.com"
   And I fill in "form_friendemail2" with "test2@email.com"
   And I fill in "form_friendemail3" with "test3@email.com"
   And I fill in "form_friendemail4" with "test4@email.com"
   And I fill in "form_friendemail5" with "test5@email.com"
   Then I press "Next"
   And I look for the output wait "30" seconds
   Then I should see "My top 3 interests"
#
#Enter Top 3 interests of a student
#
   When I fill in "cf_studentbundle_infotype_interest1" with "testing"
   When I fill in "cf_studentbundle_infotype_interest2" with "behat"
   When I fill in "cf_studentbundle_infotype_interest3" with "html"
   Then I press "Next"
   And I look for the output wait "30" seconds
   Then I should see "Almost done! Let's kickstart your profile by importing some basic info."
   When I follow "Skip this step"
   Then I should see "public profile"



