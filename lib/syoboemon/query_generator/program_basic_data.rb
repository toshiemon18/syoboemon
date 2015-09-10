#
# Syoboemon::QueryAssembler::ProgramBasicData
#

module Syoboemon
  module QueryAssembler
    class ProgramBasicData < Base
      def initialize(query_params={})
        @query_params = query_params
      end
    end
  end
end
