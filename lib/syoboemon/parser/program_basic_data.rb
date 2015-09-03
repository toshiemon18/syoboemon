module Syoboemon
	module Parser 
		class ProgramBasicData < Base

			tag "Item"
			element :title, String
			element :link, String
			element :pubDate, DateTime
			element :description, String

		end
	end
end