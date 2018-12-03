import configparser
import sys
sys.path.append('../')
from twilio_client.twilio_client import TwilioClient # NOQA

# List of phone numbers
phone_number = ["+16039304539", "+18475329344"]

# List of results from "check"
is_violated = [True, True]

# Read config file
config = configparser.ConfigParser()
config.read('../config/config.ini')

# Initialize the Twilio Client
twilioClient = TwilioClient(config=config)

# Goes through each phone # and runs the send message function if violation
for i in range(phone_number.__len__()):
    if is_violated[i] is True:
        twilioClient.sendSMS(phone_number[i])
