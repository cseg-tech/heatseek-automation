import configparser
from automation.automation import Automation


if __name__ == "__main__":
    config = configparser.ConfigParser()
    config.read('config.ini')

    automation = Automation(config=config)
    automation.run()
