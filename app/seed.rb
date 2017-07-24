filip = SlackAlertBot::Recipient.new()
filip.name = 'Filip'
filip.email = 'filip@loot.io'
filip.phone_no = '447534251167'

alert_group = SlackAlertBot::ComsGroup.new()
alert_group.recipients.push filip

SlackAlertBot::ComsGroup.add_group :alert_group, alert_group