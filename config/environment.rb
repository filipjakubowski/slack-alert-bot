require 'rubygems'
require 'bundler'
require 'active_model'

Bundler.require(:default)                   # load all the default gems
Bundler.require(Sinatra::Base.environment)  # load all the environment specific gems

require 'active_support/deprecation'
require 'active_support/all'

require './app/models/recipient'
require './app/models/coms_group'
require './app/message_providers/nexmo_text_message'
require './app/commands/alert'
require './app/messages/text_message'
require './app/bot'
require './app/seed'
require './app/web'