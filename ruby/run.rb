require 'parseconfig'
require_relative 'twilio_client/twilio_client'
require_relative 'automation/automation'

config = ParseConfig.new('config/config.ini')

# Initialize the Twilio Client
twilio_client = TwilioClient.new(config)

#Initialize the Automation Tool
automation = Automation.new(config, twilio_client)
automation.run()