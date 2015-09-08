module Syoboemon
	module QueryAssembler
		class ProgramBasicData < Base
			def initialize(query_params={})
				@query_params = query_params
				configure_rss2_parameter_attributes
			end
		end
	end
end