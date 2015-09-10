#
# Syoboemon::APIResponceParser::HappyParser::TitleItem
#

module Syoboemon
	module APIResponceParser
		module HappyParser
			class TitleItem
				include HappyMapper

				tag "TitleItem"
				element :TID, String
				element :Title, String
				element :Comment, String
			end
		end
	end
end
