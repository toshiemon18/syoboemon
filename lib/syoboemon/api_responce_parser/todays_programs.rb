#
# Syoboemon::APIResponseParser::Program BasicData < Base
#
$LOAD_PATH.unshift File.dirname(__FILE__)
require "./happy_parser/item"

module Syoboemon
	module APIResponseParser
		class TodaysPrograms
			def parse(xml_data)
				return HappyParser::Item.parse(xml_data)
			end
		end
	end
end
