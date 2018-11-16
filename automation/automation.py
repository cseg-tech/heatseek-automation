from automation import logger


class Automation():
    def __init__(self, config, twilioClient):
        self.config = config
        self.logger = logger
        self.twilioClient = twilioClient

    def run(self):
        self.logger.info("running")
        self.logger.info("Attempting to send SMS to phone num: +17342728388")
        self.twilioClient.sendSMS("+17342728388")
        self.logger.info("Finished sending attempt")
        