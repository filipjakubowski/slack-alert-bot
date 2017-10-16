require 'nexmo'

module SlackAlertBot
  module MessageProviders
    class NexmoTextMessage
      def initialize
        @client ||= Nexmo::Client.new(
          key: ENV['NEXMO_API_KEY'],
          secret: ENV['NEXMO_API_SECRET']
        )
      end

      def send(phone_no, message, :from = ENV['SENDER'])
        response = @client.send_message(from: :from, to: phone_no, text: message[:message])
      end
      
    end
  end
end
