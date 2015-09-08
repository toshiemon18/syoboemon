module Syoboemon
	module QueryAssembler
		module VoiceActorsList
			class DB < Base
				def initialize(query_params={})
					@query_params = query_params
					configure_db_parameter_attributes
				end
			end

			class Json < Base
				def initialize(query_params={})
					@query_params = query_params
					configure_json_parameter_attributes
				end
			end
		end
	end
end