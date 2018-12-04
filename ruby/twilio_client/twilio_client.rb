require 'twilio-ruby'

class TwilioClient
    def initialize(config)
        @config = config
        account_sid = config['API_KEYS']['TWILIO_ACCOUNT_SID']
        auth_token = config['API_KEYS']['TWILIO_AUTH_TOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)
        @from_number = config['TWILIO']['FROM_PHONE_NUMBER']
        @message = config['TWILIO']['SMS_MESSAGE']
    end
    def sendSMS(phone_number)
        @client.messages.create(
            to: phone_number,
            from: @from_number,
            body: @message
        )
    end

end