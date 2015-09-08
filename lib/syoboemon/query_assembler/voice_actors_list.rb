module Syoboemon
	module QueryAssembler
		module VoiceActorsList
			class DB < Base

				def initialize(query_params={})
					@query_params = query_params
					configure_db_parameter_attributes
					@query = "?" + assemble_query
				end

				private

				def configure_db_parameter_attributes
					attributes = [
						"Command",
						"TID",
						"LastUpdate",
						"Fields"
					]
					self.configure_parameter_attributes(attributes)
				end

			end

			class Json < Base

				def initialize(query_params={})
					@query_params = query_params
					configure_json_parameter_attributes
					@query = "?" + assemble_query
				end

				private

				def configure_json_parameter_attributes
					attributes = [
						"Req",
						"Title",
						"Limit"
					]
					self.configure_parameter_attributes(attributes)
				end

			end
		end
	end
end