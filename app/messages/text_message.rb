module SlackAlertBot
  module Massages
    class TextMessage
      def self.send_message(recipient, new_message)
        message_provider = SlackAlertBot::MessageProviders::NexmoTextMessage.new()
        response = message_provider.send(recipient.phone_no, message: new_message)
      end
    end
  end
end
