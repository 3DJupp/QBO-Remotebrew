#!/bin/bash
# Inspired by: https://github.com/michaelhenningersrb/home-assistant-config/wiki/Reingeneered-API-for-the-QBO-machine

Proto="https://"
Host="qbo"
curl_settings="curl -s -k -H Content-Type: application/json"
uid='00000000-0000-0000-0000-000000000000'
creator='22'
user='33'
username='smarthome'

# Get status
if [ $# -eq 1 ] && [ "$1" = "status" ]
then
	$curl_settings -X GET $Proto$Host/status/maintenance
# Get recipes
elif [ $# -eq 1 ] && [ "$1" = "recipes" ]
then
	$curl_settings -X GET $Proto$Host/recipes
# Espresso 70ml
elif [ $# -eq 1 ] && [ "$1" = "1" ]
then
	$curl_settings -d ' {"uid": "'$uid'","creatorId": "'$creator'","userId": "'$user'","userName": "'$username'","name": "Espresso","coffeeAmount": 70,"foamAmount": 0,"milkAmount": 0,"cupSize": 80,"creationTimestamp": 15,"defaultRecipe": 1,"usesHotMilk": 1,"favouriteCapsuleId": -1,"sequence": {  "index_0": 2,  "index_1": 3,  "index_2": 4,  "index_3": 0,  "index_4": 0  }}' -X POST $Proto$Host/brew
# Kaffee 170ml
elif [ $# -eq 1 ] && [ "$1" = "2" ]
then
	$curl_settings -d ' {"uid": "'$uid'","creatorId": "'$creator'","userId": "'$user'","userName": "'$username'","name": "Kaffee","coffeeAmount": 170,"foamAmount": 0,"milkAmount": 0,"cupSize": 200,"creationTimestamp": 15,"defaultRecipe": 1,"usesHotMilk": 1,"favouriteCapsuleId": -1,"sequence": {  "index_0": 2,  "index_1": 3,  "index_2": 4,  "index_3": 0,  "index_4": 0  }}' -X POST $Proto$Host/brew
else
	echo error
fi