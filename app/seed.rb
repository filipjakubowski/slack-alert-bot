require 'slack-sms-bot/models/recipient'
require 'slack-sms-bot/models/coms_group'
filip = SlackSmsBot::Recipient.new()
filip.name = 'Filip'
filip.email = 'filip@loot.io'
filip.phone_no = '447534251167'

alert_group = SlackSmsBot::ComsGroup.new()
alert_group.recipients.push filip

SlackSmsBot::ComsGroup.add_group :alert_group, alert_group