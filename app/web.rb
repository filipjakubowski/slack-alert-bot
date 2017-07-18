require 'sinatra/base'

module SlackAlertBot
  class Web < Sinatra::Base
    get '/' do
      'Keep everyone in loop.'
    end
  end
end