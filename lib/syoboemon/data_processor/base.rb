module Syoboemon
	module DataProcessor
		class Base

			def initialize(query_params={})
				unless query_params then
					@params = query_params
				else
					raise "Query　parameter is empty. (Please pass the correct parameters!)"
				end
			end

			private 

			def api_connector
				Connector.new
			end

		end
	end
end