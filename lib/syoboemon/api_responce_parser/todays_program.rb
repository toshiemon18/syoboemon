#
# Syoboemon::APIResponceParser::Program BasicData < Base
#
$LOAD_PATH.unshift File.dirname(__FILE__)
require "./happy_parser/item"

module Syoboemon
	module APIResponceParser
		class TodaysProgram < Base
			def parse(xml_data)
				return HappyParser::Item.parse(xml_data)
			end
		end
	end
end
