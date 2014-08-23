Given(/^I am on LoginPage$/) do
  $browser.goto CONFIG['default_base_url']
end

When(/^I login with valid credentials$/) do
  LoginPage.enter_email(TEST_DATA['valid_email'])
  LoginPage.enter_password(TEST_DATA['valid_password'])
  LoginPage.click_signin
end

Then(/^I should be on UserHomePage$/) do
  UserHomePage.loaded
end

When(/^I login with invalid credentials$/) do
  LoginPage.enter_email(TEST_DATA['invalid_email'])
  LoginPage.enter_password(TEST_DATA['invalid_password'])
  LoginPage.click_signin
end

Then(/^I should be on LoginPage$/) do
  LoginPage.loaded
end

Then(/^I should see login_error_message$/) do
  LoginPage.login_error_message
end
