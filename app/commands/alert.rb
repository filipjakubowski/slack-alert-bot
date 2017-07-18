require 'slack-ruby-bot'
require 'pry'

module SlackAlertBot
  module Commands
    class Alert < SlackRubyBot::Commands::Base
      command 'alert' do |client, data, _match|
        client.say(channel: data.channel, text: 'alert on the way!')
        binding.pry
        alert_group = ComsGroup.group :alert_group

        from = client.users[data.user].nil? ?  "" : "FROM: #{client.users[data.user].name} "
        channel = client.channels[data.channel].nil? ? "" : "CHANNEL: #{client.channels[data.channel].name} "
        alert_message = data['text'].sub(/(^\<\@[a-zA-Z0-9]*\>\s)?\b(alert)\b\s/,'')
        message = "[ALERT] #{from}#{channel} #{alert_message}"


        alert_group.recipients.each do |recipient|
          response = SlackAlertBot::Massages::TextMessage.send_message(recipient, message)
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