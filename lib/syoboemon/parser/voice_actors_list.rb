module Syoboemon
	module Parser
		class DB < Base

			tag "TitleItem"
			element :TID, String
			element :Title, String
			element :Comment, String

		end

		class Json

			def initialize(responce)
				@parse_data = responce
			end

			def parse
				JSON.parse(@parse_data)
			end

		end
	end
end