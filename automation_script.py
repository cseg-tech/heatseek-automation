#!/usr/bin/env python3

import sys, os

def check_config_validity(line):
	""" Check whether valid config file exists """
	#strip trailing newline
	line = line.rstrip()

	#find first comment - ignore the rest
	comment_index = line.find('#')
	if comment_index == 0:
		return ''
	elif comment_index != -1:
		line = line[:comment_index]
	
	#find first colon - separate into key, value pairing
	colon_index = line.find(':')
	if  (colon_index == -1 or len(line[:colon_index]) == 0 or len(line[colon_index + 1:]) == 0):
		sys.stderr.write("Error: invalid colon in config file")
		sys.exit(1)
	return line
	
def get_config_settings(file_path):
	""" Parse through and find key:value pairs of config file """
	config_dict = {}
	with open(file_path) as fp:
		for line in fp:
			line = check_config_validity(line)
			if line:
				colon_index = line.find(':')
				key = line[:colon_index].strip()
				value = line[colon_index + 1:].strip()
				config_dict[key] = value 
	return config_dict


def usage():
	""" Script usage message """
	sys.stderr.write('Usage: python automation_script.py data_input config_file')
	sys.exit(1)

#main function
if __name__ == "__main__":
	#check script arguments
	if len(sys.argv) != 3:
		usage()

	#import file arguments
	data_input = sys.argv[1]
	config_file = sys.argv[2]

	config_dict = get_config_settings(config_file)
	print(config_dict)

	# TODO: integrate with google sheets or write our own update csv file

	# TODO: integrate with Twilio

	# TODO: integrate with GetResponse

	