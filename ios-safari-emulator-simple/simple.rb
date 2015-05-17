# Include the needed gems
require 'rubygems'  
require 'appium_lib'  

# Configure call to Appium Server
desired_caps = {  
   caps:  {  
    platformName: 'iOS',  
    platformVersion: '8.1',  
    deviceName: 'iPhone 5s',  
    browserName: 'Safari',  
   }  
  } 

# Create a new Appium driver
@driver = Appium::Driver.new(desired_caps).start_driver 

# Promote appium method to class instance methods
Appium.promote_appium_methods Object  

# Open web page
# Note apple.com open first unless you override it in caps using safariInitialUrl
@driver.get("http://www.google.com/")  

# Extra time to allow webpage to load
sleep(5)

# Find Search Box element, click on it, type in Search Query 
element = @driver.find_element(:id, 'lst-ib')
element.click
element.send_keys 'Steven Miller Dentedghost Appium'
# Extra pause for demostration
sleep(2)

# Find Search Button element, click on it
element = @driver.find_element(:id, 'tsbb')
element.click

# Extra time to allow webpage to load
sleep (5)

# Properly close down the driver
driver_quit

# Print test pass success message
puts "Tests Succeeded"
