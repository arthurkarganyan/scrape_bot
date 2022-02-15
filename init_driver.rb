require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'

# # driver.get('https://2ch.hk/soc/res/5959967.html')
# driver.get('https://www.facebook.com/events/search?q=Sieci%20kontakt%C3%B3w&sde=AbrQ9KopLfqYT7heXVVCxznkZYxRr9hU1JA4cdLbJhjgs56yyeHW3e833A9dGP1WlEHOyagjWyFL9Y79gw-Ko1iVuJCILVkpVsHkmSbBFb3SEA&filters=eyJmaWx0ZXJfZXZlbnRzX2NhdGVnb3J5OjAiOiJ7XCJuYW1lXCI6XCJmaWx0ZXJfZXZlbnRzX2NhdGVnb3J5XCIsXCJhcmdzXCI6XCIxOTE1MTA0MzAyMDQyNTM2XCJ9IiwicnBfZXZlbnRzX2xvY2F0aW9uOjAiOiJ7XCJuYW1lXCI6XCJmaWx0ZXJfZXZlbnRzX2xvY2F0aW9uXCIsXCJhcmdzXCI6XCIxMTAxNDU1NzIzNDIwMzVcIn0ifQ%3D%3D')

# # https://stackoverflow.com/questions/53039551/selenium-webdriver-modifying-navigator-webdriver-flag-to-prevent-selenium-detec/53040904
Capybara.register_driver :selenium_chrome_modified do |app|
  version = Capybara::Selenium::Driver.load_selenium
  options_key = Capybara::Selenium::Driver::CAPS_VERSION.satisfied_by?(version) ? :capabilities : :options
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    # Workaround https://bugs.chromium.org/p/chromedriver/issues/detail?id=2650&q=load&sort=-id&colspec=ID%20Status%20Pri%20Owner%20Summary
    opts.add_argument('--disable-site-isolation-trials')
    opts.add_argument('--disable-blink-features=AutomationControlled')
  end
  
  Capybara::Selenium::Driver.new(app, **{ :browser => :chrome, options_key => browser_options })
end

Capybara.current_driver = :selenium_chrome_modified
Capybara.run_server = false
