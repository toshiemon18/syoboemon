module Syoboemon
	module QueryAssembler
		class Base
			attr_accessor :query_params

			def initialize(params={})
				@query_params = params
				@parameter_attributes = []
			end

			def configure_parameter_attributes(attributes=[])
				attributes.each do |elem|
					@parameter_attributes << elem.to_s
				end
			end

			def query_assemble
				reject_nil_value
			end

			private
			def reject_nil_value
				@query_params.reject { |key, value| value.nil? }
			end
		end
	end
end