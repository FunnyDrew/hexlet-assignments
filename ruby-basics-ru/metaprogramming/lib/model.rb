# frozen_string_literal: true
require 'byebug'

# BEGIN
module Model
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		def attribute(name, options = {})
			define_method name do
				value = self.instance_variable_get "@#{name}"
				converted_value = value
				if options[:type] == :datetime
					converted_value = DateTime.parse(value)
				end
				converted_value
			end

			define_method "#{name}=" do |value|				
				self.instance_variable_set "@#{name}", value
				
				@params.merge!("#{name}": value)
			end
		end
	end

	def initialize(params_list={})
		instance_variable_set '@params', params_list
		params_list.each do |name, value|
			instance_variable_set "@#{name}", value
		end
	end

	def attributes
		@params.each do |key, value|
			@params[key] = self.send(key)
		end
	end
end

# END
