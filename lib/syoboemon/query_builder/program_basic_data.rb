module Syoboemon
	module QueryBuilder
		class ProgramBasicData < Base

			def initialize(query_params={})
				@query_params = query_params
				configure_rss2_parameter_attributes
				@query = "?" + assemble_query
			end

			private

			def configure_rss2_parameter_attributes
				attributes = [
					"user",
					"filter",
					"count",
					"days",
					"titlefmt"
				]
				self.configure_parameter_attributes(attributes)
			end

		end
	end
end