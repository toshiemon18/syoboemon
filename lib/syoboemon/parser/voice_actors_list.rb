#
# Syoboemon::Parser::DB < Base
# Syoboemon::Parser::Json
#
$LOAD_PATH.unshift File.dirname(__FILE__)
require "./happy_parser/title_item"

module Syoboemon
  module Parser
    class DB < Base
      def parse(xml_data)
        return HappyParser::TitleItem.parse(xml_data)
      end
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
