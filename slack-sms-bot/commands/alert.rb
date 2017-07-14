require 'slack-ruby-bot'
require 'pry'

module SlackSmsBot
  module Commands
    class Alert < SlackRubyBot::Commands::Base
      command 'alert' do |client, data, _match|
        client.say(channel: data.channel, text: 'alert on the way!')

        alert_group = ComsGroup.group :alert_group

        message = data['text'].sub(/(^\<\@[a-zA-Z0-9]*\>\s)?\b(alert)\b\s/,'')

        alert_group.recipients.each do |recipient|
          response = SlackSmsBot::Massages::TextMessage.send_message(recipient, message)
          if response["messages"].first["status"] == "0"
            client.say(channel: data.channel, text: "alert was sent to #{recipient.name}")
          else
            client.say(channel: data.channel, text: "error - alert was not sent to #{recipient.name}")
          end
        end
      end
    end
  end
end