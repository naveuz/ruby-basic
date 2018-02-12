module Accessors
  module ClassMethods
    def attr_accessor_with_history(*attributes)
      attributes.each do |attribute|
        name = "@#{attribute}".to_sym
        history = []
        define_method(attribute) { instance_variable_get(name) }
        define_method("#{attribute}=".to_sym) do |value|
          instance_variable_set(name, value)
          history << instance_variable_get(name)
        end
        define_method("#{attribute}_history".to_sym) { history }
      end
    end

    def strong_attr_acessor(attribute, class_name)
      name = "@#{attribute}".to_sym
      define_method(attribute) { instance_variable_get(name) }
      define_method("#{attribute}=".to_sym) do |value|
        raise 'Неверный тип!' unless value.is_a? class_name
        instance_variable_set(name, value)
      end
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
  end
end
