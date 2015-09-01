module Syoboemon
	module QueryBuilder
		class Base

			attr_reader :query_params

			def initialize(query_params={})
				@query_params = query_params
				@query = "?"
			end

			def configure_parameter_attributes(attributes=[])
				attributes.each do |elem|
					parameoer_attributes << elem.to_s
				end
			end

			def assemble_query
				@query << @query_params.map do |k, v|
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
				parameoer_attributes.each_key do |key|
					if (/#{attribute}/i === key) then
						return key
					end
				end
				raise "Specified attribute does not exist."
			end
		end
	end
end