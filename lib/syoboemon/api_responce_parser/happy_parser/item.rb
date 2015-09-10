#
# Syoboemon::APIResponceParser::HappyParser::Item
#

module Syoboemon
	module APIResponceParser
		module HappyParser
			class Item
				include HappyMapper

				element :title, String
				element :link, String
				element :pubDate, DateTime
				element :description, String
			end
		end
	end
end
