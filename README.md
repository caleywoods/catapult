CATAPULT
========


This is a simple app to accept an HTTP POST coming from a Twilio received SMS and forward it to a [Grove.io](http://Grove.io) chat room.


##Why do you need this?
Glad you asked! Grove now supports sending "notifications" to your channel via HTTP POST. So after I wrote the Hubot script that lets
you send SMS messages from Hubot (and thereby, Grove) I wanted a way to get any replies to come back into the room. This is that solution.

Basically when someone texts your Twilio number, they do an HTTP POST to Catapult. Catapult then takes that POST and makes another POST
to your grove room using their API. Catapult probably wouldn't be needed if Grove could identify POSTs coming from Twilio and line up
Twilio's 'Body' header with the Grove 'message' header and supply a default of 'Twilio' for the Grove 'service' header.

Feel free to tweak this.

It's powered by Sinatra.