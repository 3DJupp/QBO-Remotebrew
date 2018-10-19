# Controlling an IOT enabled Coffeemaker (Tchibo / QBO)

Inspired by michaelhenningersrb and fhainz I decided to get in touch with QBO, a coffeemachine equiped with WiFi, voice and app control.

**[ wiki for a list of commands ]( https://github.com/michaelhenningersrb/home-assistant-config/wiki )**

**[script for FHEM (including qloud commands)](https://github.com/fhainz/QboCoffee-FHEM/blob/master/FHEM/70_QboCoffee.pm )**

The machine will listen on port 443, using self signed certificates.
I want to control the machine using OpenHAB, so at first I'll create a bash script.
