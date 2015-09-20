#
# Syoboemon::QueryGenerator::ProgramDetailSearch
# included DB class and Json class
#

# DB => コンストラクタに渡されたTitle IDからdb.phpのクエリを生成する
# Json => コンストラクタに渡された番組タイトルからjson.phpのクエリを生成する

module Syoboemon
	module QueryGenerator
		module ProgramDetailSearch
			class DB
				attr_accessor :title_id

				def initialize(title_id="")
					@tid = title_id.to_s
				end

				def generate_query
					query = {
						Commend: "TitleLookup",
						TID: @tid.to_s
					}
				end
			end

			class Json
				attr_accessor :title

				def initialize(title="")
					@title = title.to_s
				end

				def generate_query
					query = {
						Req: "TitleSearch",
						Title: @title.to_s,
						Limit: 15
					}
				end
			end
		end
	end
end
