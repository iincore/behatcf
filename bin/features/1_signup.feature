Feature: collegefeed sign up
	In order to create my profile on collegefeed
	As a student
	I need to be able to sign up to the collegefeed

 @javascript
Scenario: Sign up to collegefeed
	Given I am on "/register/"
	And I fill in "email_1click" with "{signup_email}"
	And I fill in "passwd_1click" with "{password}"
	Then I press "Sign up"
	And I should see "Welcome to collegefeed!"
#
#Enter student school details
#

   When I fill in "cf_studentbundle_usernamegraduationtype_schoolRecord_university" with "Stanford University"
   And I fill in "cf_studentbundle_usernamegraduationtype_schoolRecord_major" with "{signup_email}"
   And I fill in "email_1click" with "{signup_email}"




