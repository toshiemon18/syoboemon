#
# Syoboemon::QueryGenerator::TodaysPrograms
#

module Syoboemon
	module QueryGenerator
		class TodaysPrograms
			attr_accessor :usr
			def initialize(user_name="")
				unless user_name.empty? then
					@usr = user_name
				else
					raise "Please enter your account name."
				end
			end

			def generate_query
				query = {
					usr: @usr.to_s,
					filer: "0",
					count: "3000",
					days: "1",
					titlefmt: "$(StTime) $(ShortTitle) $(SubTitleB) $(ChName) $(TID) $(Cat)"
				}
			end
		end
	end
end
