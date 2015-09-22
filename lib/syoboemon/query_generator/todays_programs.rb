#
# Syoboemon::QueryGenerator::TodaysPrograms
#

# コンストラクタに渡されたユーザネームからrss2.phpのクエリを生成する

module Syoboemon
	module QueryGenerator
		class TodaysPrograms
			attr_accessor :usr
			
			def initialize(user_name="")
				@usr = user_name.to_s
			end

			def generate_query
				query = {
					usr: "#{@usr.to_s}",
					filer: "0",
					count: "3000",
					days: "1",
					titlefmt: "$(StTime)-$(ShortTitle)-$(SubTitleB)-$(ChName)-$(TID)-$(Cat)"
				}
			end
		end
	end
end
