require 'slack-ruby-bot'

module SlackAlertBot
  module Commands
    class Alert < SlackRubyBot::Commands::Base
      command 'alert' do |client, data, _match|
        client.say(channel: data.channel, text: 'alert on the way!')

        alert_group = ComsGroup.group :alert_group

        alert_message = data['text'].sub(/(^\<\@[a-zA-Z0-9]*\>\s)?\b(alert)\b\s/,'')
        message = "[ALERT] #{from}#{channel} #{alert_message}"

          # response = SlackAlertBot::Massages::TextMessage.send_message(recipient, message)
          # if response["messages"].first["status"] == "0"
          #   client.say(channel: data.channel, text: "sms was sent to #{recipient.name}")
          # else
          #   client.say(channel: data.channel, text: "error - sms was not sent to #{recipient.name}")
          # end
        end
      end
    end
  end
end