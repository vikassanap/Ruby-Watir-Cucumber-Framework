class UserHomePage
	class << self

	def userlabel
		$browser.a(:text,'+Vikas')
	end

	def loaded
		userlabel.visible?
	end

	end
end