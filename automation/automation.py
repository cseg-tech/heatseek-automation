from automation import logger


class Automation():
    def __init__(self, config):
        self.config = config
        self.logger = logger

    def run(self):
        self.logger.info("im running yo")
