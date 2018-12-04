class Automation
    def initialize(config, twilio_client)
        @config = config
        @twilio_client = twilio_client
    end

    def run
        client_number = @config['TWILIO']['CLIENT_PHONE_NUMBER']
        @twilio_client.sendSMS(client_number)
    end
end