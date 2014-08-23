Feature: Gmail Signin
Login with valid and invalid credentials

Background: Settings for the test
Given I am on LoginPage

Scenario: Login with valid credentials
When I login with valid credentials
Then I should be on UserHomePage

Scenario: Login with invalid credentials
When I login with invalid credentials
Then I should be on LoginPage
And I should see login_error_message

