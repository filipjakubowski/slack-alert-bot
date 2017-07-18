module SlackAlertBot
  class ComsGroup
    attr_accessor :recipients

    def initialize
      @recipients = Array.new
      @@groups = {}
    end
    def self.add_group(group_sym, group)
      @@groups[group_sym] = group
    end

    def self.group(group_sym)
      @@groups[group_sym]
    end
  end
end