module Syoboemon
	module QueryBuilder
		class Base

			attr_accessor :query_params
			attr_reader :query

			def initialize(query_params={})
				@query_params = query_params
				@query = "?" + assemble_query
			end

			def configure_parameter_attributes(attributes=[])
				attributes.each do |elem|
					parameoer_attributes << elem.to_s
				end
			end

			def assemble_query
				@query_params.map do |k, v|
					begin
						k = determine_params_name_consistency(k)
						"#{k}=#{v}"
					rescue => e
						puts e.message
						exit 1
					end
				end.join("&")
			end

			private

			parameoer_attributes = []

			def determine_params_name_consistency(attribute, api_type)
				parameoer_attributes.each { |key| return key if /#{attribute}/i === key }
				raise "Specified attribute does not exist."
			end
		end
	end
end