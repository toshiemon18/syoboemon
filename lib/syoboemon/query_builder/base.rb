module Syoboemon
	module QueryBuilder
		class Base

			attr_reader :params

			OPTIONS = {
				rss2: [ "user", "filter", "count", "days", "titlefmt" ],
				db: [ "TID", "LastUpdate", "Fields" ],
				json: [ "Title", "Limit" ]
			}

			def initialize(query_params={})
				@query_params = query_params
				@query = "?"
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

			def determine_params_name_consistency(attribute, api_type)
				OPTIONS[api_type.to_sym].each_key do |key|
					if (/#{attribute}/i === key) then
						return key
					end
				end
				raise "Specified attribute does not exist."
			end
		end
	end
end