module Validation
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :validators

    def validate(attribute, *params)
      @validators ||= []
      @validators << { attribute => params }
    end
  end

  module InstanceMethods
    def validate!
      self.class.validators.each do |validator|
        validator.each do |attribute, params|
          attr_value = instance_variable_get("@#{attribute}".to_sym)
          send(params[0], attr_value, params[1])
        end
      end
      true
    end

    def valid?
      validate!
    rescue StandardError
      false
    end

    private

    def presence(value, option)
      raise 'Не может быть пустым!' if value.strip.empty? || value.nil?
    end

    def format(value, option)
      raise 'Не соответствует формат!' if value !~ option
    end

    def type(value, option)
      raise 'Не соответствует тип!' unless value.is_a? option
    end
  end
end
