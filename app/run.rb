require 'parseconfig'

require_relative 'twilio_client/twilio_client'
require_relative 'automation/automation'
require_relative 'email/email'
require_relative 'email/testemail'

config = ParseConfig.new('./app/config.ini')

# Initialize the Twilio Client
twilio_client = TwilioClient.new(config)

email_client = EmailClient.new(config)

email = Email.new()
email.to = 'nl2523@columbia.edu'
email.from = 'Maggie Fei <maggieyfei@gmail.com>'
email.subject = 'Testing Testing' 
email.text_body = 'Hi maggie' 
email.content_type = 'text/html; charset=UTF-8'
email.html_body = '<b>Hi maggie</b>'

email_client.send_email(email)

#Initialize the Automation Tool
automation = Automation.new(config, twilio_client, email_client)
automation.run()