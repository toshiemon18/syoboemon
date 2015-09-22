#
# Syoboemon::Connector module
#

# しょぼいカレンダーAPIを利用するためのモジュール

module Syoboemon
	module APIConnector
		URL = "http://cal.syoboi.jp"
		RSS2_PATH = "/rss2.php"
		DB_PATH = "/db.php"
		JSON_PATH = "/json.php"

		class << self
			# APIConnector#get_rss2, APIConnector#get_db, APIConnector#get_jsonについて
			# 引数にはAPIのパラメータをまとめたHashを渡すこと

			# rss2.phpを利用するためのメソッド
			# Example => APIConnector.rss2_get({usr: "example_name", filter: 0, count: 150, ...})
			def get_rss2(query_params={})
				begin
					return connector.get(rss2_path, query_params).body
				rescue => e
					puts "#{e.messege}"
					exit
				end
			end

			# db.phpを利用するためのメソッド
			# Example => APIConnector.db_get({Command: "TitleLookup", TID: 9029, Fields: "Comment,TID..."})
			def get_db(query_params={})
				begin
					return connector.get(db_path, query_params).body
				rescue => e
					puts "#{e.message}"
					exit
				end
			end

			# json.phpを利用するためのメソッド
			# Example => APIConnector.json_get({Req: "TitleSearch", Title: "ご注文はうさぎですか？", Limit: 15})
			def get_json(query_params={})
				begin
					return connector.get(json_path, query_params).body
				rescue => e
					puts "#{e.message}"
					exit
				end
			end

			private
			def connector
				connector ||= Faraday::Connection.new(url: url) do |c|
					c.request :url_encoded
					c.adapter :net_http
					# c.response :logger
					c.response :raise_error
				end
			end

			def url
				URL
			end

			def rss2_path
				RSS2_PATH
			end

			def db_path
				DB_PATH
			end

			def json_path
				JSON_PATH
			end
		end
	end
end
