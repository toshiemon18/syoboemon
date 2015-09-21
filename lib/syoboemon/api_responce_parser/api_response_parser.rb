#
# Syoboemon::APIResponseParser::Item
# Syoboemon::APIResponseParser::TitleItem
# Syoboemon::APIResponseParser::Json
#

module Syoboemon
	module APIResponseParser
		class Item
			include HappyMapper

			element :title, String
			element :link, String
			element :pubDate, DateTime
			element :description, String
		end

		class TitleItem
			include HappyMapper

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
				return JSON.parse(@parse_data)["Titles"].keys[0]
			end
		end
	end
end
