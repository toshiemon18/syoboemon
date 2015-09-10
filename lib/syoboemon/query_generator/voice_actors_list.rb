#
# Syoboemon::QueryAssembler::VoiceActorsList
# included DB class and Json class
#

module Syoboemon
  module QueryAssembler
    module VoiceActorsList
      class DB < Base
        def initialize(query_params={})
          @query_params = query_params
        end
      end

      class Json < Base
        def initialize(query_params={})
          @query_params = query_params
        end
      end
    end
  end
end
