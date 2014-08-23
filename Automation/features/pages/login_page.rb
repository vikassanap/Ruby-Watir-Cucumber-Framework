class LoginPage
	class << self

		def email
			$browser.text_field(:id,'Email')
		end

		def password
			$browser.text_field(:id,'Passwd')
		end

		def signin
			$browser.button(:id,'signIn')
		end

		def enter_email(value)
			email.when_present.set value
		end

		def enter_password(value)
			password.when_present.set value
		end 

		def click_signin
			signin.when_present.click
		end

		def loaded
			email.visible?
			password.visible?
			signin.visible?
		end

		def login_error_message
			$browser.span(:text,/The email or password you entered is incorrect./).visible?
		end

	end
end