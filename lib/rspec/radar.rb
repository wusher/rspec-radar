require 'rspec/mocks'



module RSpec
  module Radar
    class Error < StandardError; end
    class UndefinedMethodError < Error; end
  end
end

module RSpec
  module Mocks
    class MethodDouble < Hash

      def current_object
        instance_variable_get(("@object").intern)
      end

      def visibility
        if TestDouble === self.current_object
          'public'
        elsif object_singleton_class.private_method_defined?(self.method_name)
          'private'
        elsif object_singleton_class.protected_method_defined?(self.method_name)
          'protected'
        elsif object_singleton_class.public_method_defined?(self.method_name)
          'public'
        elsif self.current_object.respond_to? self.method_name
          'public'
        else
          raise Radar::UndefinedMethodError, "Attempt to stub unknown method '#{self.method_name}'"
        end
      end
    end
  end
end

