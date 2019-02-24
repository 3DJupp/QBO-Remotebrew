#!/bin/bash
# Inspired by: https://github.com/michaelhenningersrb/home-assistant-config/wiki/Reingeneered-API-for-the-QBO-machine

curl_settings="curl -s -k -H Content-Type: application/json"
prefix="https://"
path="/etc/openhab2/scripts/qbo"
qloud_url="https://qloud.qbo.coffee"

# Get status
if [ $# -eq 2 ] && [ "$2" = "status" ]
then
	$curl_settings -X GET $prefix$1/status/maintenance
# Get machineinfo
elif [ $# -eq 2 ] && [ "$2" = "machineinfo" ]
then
	$curl_settings -X GET $prefix$1/machineInfo
# Get firmwareinfo
elif [ $# -eq 1 ] && [ "$1" = "fw" ]
then
	$curl_settings -X GET $qloud_url/firmware/latest
# Get recipes
elif [ $# -eq 2 ] && [ "$2" = "recipes" ]
then
	$curl_settings -X GET $prefix$1/recipes
# post JSON file to machine
elif [ $# -eq 2 ] && [ -f $path/$2.json ]
then
	$curl_settings -d @"$path/$2.json" $prefix$1/brew
else
	echo error
fi


