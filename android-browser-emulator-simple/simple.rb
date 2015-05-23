# Include the needed gems
require 'rubygems'  
require 'appium_lib'  

# Configure call to Appium Server
# More information is available at http://appium.io/slate/en/master/?ruby#appium-server-capabilities.
desired_caps = {  
   caps:  {  
        platformName:  'Android',
        platformVersion: '5.1',
        deviceName:    'Nexus_5_API_22_x86',
        browserName:   'Browser',
    }  
} 

# Create a new Appium specific driver with helpers availabe
@appium_driver = Appium::Driver.new(desired_caps) 

# Standard Selenium driver without any Appium methods.
# Need to convert to Selenium driver to make "get" call 
# since Appium doesn't support "get" method.
@selenium_driver = @appium_driver.start_driver

# Promote appium method to class instance methods
# Without promoting we would need to make all calls with the @appium_driver, example:
#   @appium_driver.find_element(:id, 'lst-ib') 
# After promoting to a class instance method we can the method directly, example:
#   find_element(:id, 'lst-ib') 
Appium.promote_appium_methods Object  

# Open web page
# Note apple.com open first unless you override it in caps using safariInitialUrl
@selenium_driver.get("http://www.google.com/")  

# Extra time to allow webpage to load
sleep(5)

# Find Search Box element, click on it, type in Search Query 
element = find_element(:id, 'lst-ib')
element.click
element.send_keys 'Steven Miller Dentedghost Appium'
# Extra pause for demostration
sleep(2)

# Find Search Button element, click on it
element = find_element(:id, 'tsbb')
element.click

# Extra time to allow webpage to load
sleep (5)

# Properly close down the driver
driver_quit

# Print test pass success message
puts "Tests Succeeded"
