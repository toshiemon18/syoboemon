module Syoboemon
	module QueryBuilder
		class ProgramBasicData < Base

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