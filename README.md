# README

This is a reference implementation showing how a Ruby on Rails application can control a NeoPixel 240 Led Strip using Apiotics.

Note that in order to use this application for yourself, you will need to edit the apiotics.rb file to reference your hive's public and private keys.

Also note that this application currently permits only users with apiotics.com, microarx.com or websensing.com email addresses to register.  To change this, edit the app/models/user.rb file.

This application is currently configured to deploy to Heroku.  Please see the documentation on deploying to Heroku on Apiotics.com

The application requires that email addresses be confirmed.  The settings for the email provider in production are in app/config/environments/production.rb
