require 'logger'

class Automation
    def initialize(config, twilio_client, email_client)
        @config = config
        @logger = Logger.new(STDOUT)
        @twilio_client = twilio_client
        @email_client = email_client
    end

    def send_email(email)
        @email_client.send_email(email)
    end

    def run
        @logger.info("Running")
        client_number = @config['TWILIO']['CLIENT_PHONE_NUMBER']
        @logger.info("Attempting to send SMS to phone number")
        @twilio_client.sendSMS(client_number)
        @logger.info("Finished sending attempt")
    end
end