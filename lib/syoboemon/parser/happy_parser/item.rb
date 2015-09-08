#
# Syoboemon::Parser::HappyParser::Item
#

module Syoboemon
	module Parser
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