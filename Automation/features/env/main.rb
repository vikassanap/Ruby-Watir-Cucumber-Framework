require "rubygems" 
require "watir"
require "cucumber"
require "headless"
require "watir-webdriver"

#Create Input Test Data File Objects
CONFIG = YAML.load_file("#{File.dirname(__FILE__)}/../../input/config.yml")
PAGE_DEFAULTS = YAML.load_file("#{File.dirname(__FILE__)}/../../input/page_defaults.yml")
TEST_DATA = YAML.load_file("#{File.dirname(__FILE__)}/../../input/test_data.yml")


#Method To Set Base URL Value
def set_base_url
  $base_url = (ENV['base_url'].nil? || ENV['base_url'].empty?) ? CONFIG['default_base_url'] : ENV['base_url']
end
set_base_url

if(ENV['mode'] == 'headless')
	$headless=Headless.new
	$headless.start
end

case ENV['browser']
when 'mozilla'
	$browser= Watir::Browser.new :ff
when 'chrome'
	$browser= Watir::Browser.new :chrome
else
	$browser= Watir::Browser.new :ff
end	

$browser.driver.manage.timeouts.implicit_wait = 5
$browser.driver.manage.window.maximize

Before do |scenario|
  
end

After do |scenario|
  $browser.cookies.clear
  if(ENV['mode'] == 'headless')
     if(scenario.failed?)
           $headless.take_screenshot "#{File.dirname(__FILE__)}/../../reports/screenshots/#{scenario.name.split.join("_")}.jpg"
      end
  end
end

at_exit do
  $browser.close
    if(ENV['mode'] == 'headless')
      $headless.destroy
    end
end

