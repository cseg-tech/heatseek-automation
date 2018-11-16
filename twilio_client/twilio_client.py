from twilio.rest import Client
import twilio


class TwilioClient():
    def __init__(self, config):
        self.config = config
        # if 'API_KEYS' in config:
        account_sid = config['API_KEYS']['TWILIO_ACCOUNT_SID']
        auth_token = config['API_KEYS']['TWILIO_AUTH_TOKEN']
        self.client = Client(account_sid, auth_token)
        # if 'TWILIO' in config:
        self.from_number = config['TWILIO']['FROM_PHONE_NUMBER']
        self.message = config['TWILIO']['SMS_MESSAGE']

    def sendSMS(self, phone_number):
        ''' Tries to send a message to the user, does not send if client has
        requested to STOP receiving messages'''
        try:
            message = self.client.messages.create(
                to=phone_number,
                from_=self.from_number,
                body=self.message)
            print(message.sid)
        except twilio.base.exceptions.TwilioRestException:
            print("Message not sent, user said to STOP")
