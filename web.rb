require 'sinatra/base'

module SlackSmsBot
  class Web < Sinatra::Base
    get '/' do
      'Keep everyone in loop.'
    end
  end
end