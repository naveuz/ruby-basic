module InstanceCounter
  module ClassMethods
    attr_reader :instances

    private
    def counter
      @instances ||= 0
      @instances += 1
    end
  end

  module InstanceMethods
    private
    def register_instance
      self.class.send :counter
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
