from automation import logger


class Automation():
    def __init__(self, config, twilioClient):
        self.config = config
        self.logger = logger
        self.twilioClient = twilioClient

    def run(self):
        self.logger.info("running")
        client_number = self.config['TWILIO']['CLIENT_PHONE_NUMBER']
        self.logger.info("Attempting to send SMS to phone num")
        self.twilioClient.sendSMS(client_number)
        self.logger.info("Finished sending attempt")
