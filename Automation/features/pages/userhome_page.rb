class UserHomePage
	class << self

	def userlabel
		$browser.a(:text,'+UserName')
	end

	def loaded
		userlabel.visible?
	end

	end
end
