                   __                              ___    __      
                  /\ \__                          /\_ \  /\ \__   
      ___     __  \ \ ,_\    __     _____   __  __\//\ \ \ \ ,_\  
     /'___\ /'__`\ \ \ \/  /'__`\  /\ '__`\/\ \/\ \ \ \ \ \ \ \/  
    /\ \__//\ \L\.\_\ \ \_/\ \L\.\_\ \ \L\ \ \ \_\ \ \_\ \_\ \ \_ 
    \ \____\ \__/.\_\\ \__\ \__/.\_\\ \ ,__/\ \____/ /\____\\ \__\
     \/____/\/__/\/_/ \/__/\/__/\/_/ \ \ \/  \/___/  \/____/ \/__/
                                      \ \_\                       
                                       \/_/


This is a simple app to accept an HTTP POST coming from a Twilio received SMS and forward it to a [Grove.io](http://Grove.io) chat room.


## Why do you need this?
Glad you asked! Grove now supports sending "notifications" to your channel via HTTP POST. So after I wrote the Hubot script that lets
you send SMS messages from Hubot (and thereby, Grove) I wanted a way to get any replies to come back into the room. This is that solution.

Basically when someone texts your Twilio number, they do an HTTP POST to Catapult. Catapult then takes that POST and makes another POST
to your grove room using their API. Catapult probably wouldn't be needed if Grove could identify POSTs coming from Twilio and line up
Twilio's 'Body' header with the Grove 'message' header and supply a default of 'Twilio' for the Grove 'service' header.

Feel free to tweak this.

It's powered by Sinatra.

## Setup

* Clone this repo - git clone git://github.com/caleywoods/catapult.git
* cd catapult
* heroku create appname
* heroku config:add grove_api_key=sooper_secret_key
* git push heroku master

This should deploy your version of catapult out to Heroku. Then you need to login to Twilio and setup your SMS number to
HTTP POST to http://yourapp.heroku.com/incoming

Once this is complete you should be able to SMS the Twilio Number and see your replies in the Grove channel.

![Example](http://i.imgur.com/fJkBX.png)
