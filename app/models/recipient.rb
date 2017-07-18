module SlackAlertBot
  class Recipient
    include ActiveModel::Validations

    attr_accessor  :name, :email, :phone_no
    validates_presence_of :name, :email, :phone_no
  end
end