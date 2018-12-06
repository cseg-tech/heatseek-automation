require 'twilio-ruby'
require 'logger'

class TwilioClient
    def initialize(config)
        puts config.groups
        @config = config
        @logger = Logger.new(STDOUT)
        account_sid = config['API_KEYS']['TWILIO_ACCOUNT_SID']
        auth_token = config['API_KEYS']['TWILIO_AUTH_TOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)
        @from_number = config['TWILIO']['FROM_PHONE_NUMBER']
        @message = config['TWILIO']['SMS_MESSAGE']
    end

    def sendSMS(phone_number)
        begin
        @client.messages.create(
            to: phone_number,
            from: @from_number,
            body: @message
        )
        rescue
            @logger.warn("Message not sent, user said to STOP")
        end
    end

end