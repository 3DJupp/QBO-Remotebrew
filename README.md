# Controlling an WiFi enabled Coffeemaker (Tchibo / QBO YouRista)

Inspired by michaelhenningersrb and fhainz I decided to get in touch with QBO, a coffeemachine equiped with WiFi, voice and app control.

The machine will listen on port 443, using self signed certificates.
I want to control the machine using OpenHAB, so I created a bash script that can excecute some important curl snippets.

At the moment the script supports the following:

| Command | Description |
| --- | --- |
|./qbo.sh $Host status | Get status of your QBO (cleaning/descale) |
|./qbo.sh $Host machineinfo | Get info about the hardware(Firmware/MAC) |
|./qbo.sh fw | Get info about latest firmware from qloud Portal |
|./qbo.sh $Host recipes | Get recipes stored on the machine |
|./qbo.sh $Host $jsonfile | Send a recipe to the machine / can be started at the machine |

Since the system is closed source i got the URLs by digging within the applications.
## Qloud URLs
https://qloud.qbo.coffee/firmware/latest   <--- Without Login

https://qloud.qbo.coffee/oauth/token

https://qloud.qbo.coffee/accounts/compare

https://qloud.qbo.coffee/accounts/logout

## Local URLs
https://$Host/machineInfo

https://$Host/status/maintenance

https://$Host/settings

https://$Host/settings/name

https://$Host/settings/sleep

https://$Host/settings/settings/wifi/sleepmode

https://$Host/settings/availableLanguages

https://$Host/v2/recipes	<--- get v2 recipes from the machine

https://$Host/recipes		<--- get recipes from the machine

https://$Host/brew			<--- send recipe to your machine / needs to be started at the macine

Not figured out yet how to send a (Timed/Remotebrew) recipe

https://$Host/remote/brew	<--- send recipe to your machine / "Remotebrew"

https://$Host/timed/brew	<--- send recipe to your machine / "Timedbrew"
