import configparser
from automation.automation import Automation
from twilio_client.twilio_client import TwilioClient

if __name__ == "__main__":
    config = configparser.ConfigParser()
    config.read('config/config.ini')

    # Initialize the Twilio Client
    twilioClient = TwilioClient(config=config)

    # Initialize the Automation Tool
    automation = Automation(config=config, twilioClient=twilioClient)
    automation.run()
