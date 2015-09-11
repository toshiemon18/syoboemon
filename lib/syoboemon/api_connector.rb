#
# Syoboemon::Connector module
#

# しょぼいカレンダーAPIを利用するためのモジュール

require "rubygems"
require "faraday"

module Syoboemon
	module APIConnector
		URL = "http://cal.syoboi.jp"
		RSS2_PATH = "/rss2.php"
		DB_PATH = "/db.php"
		JSON_PATH = "/json.php"

		class << self
			# APIConnector#rss2_get, APIConnector#db_get, APIConnector#json_getについて
			# 引数にはAPIのパラメータをまとめたHashを渡すこと

			# rss2.phpを利用するためのメソッド
			# Example => APIConnector.rss2_get({usr: "example_name", filter: 0, count: 150, ...})
			def rss2_get(query_params={})
				begin
					connection.get(rss2_path, query_params)
				rescue => e
					puts "#{e.messege}"
					exit
				end
			end

			# db.phpを利用するためのメソッド
			# Example => APIConnector.db_get({Command: "TitleLookup", TID: 9029, Fields: "Comment,TID..."})
			def db_get(query_params={})
				begin
					connection.get(db_path, query_params)
				rescue => e
					puts "#{e.message}"
					exit
				end
			end

			# json.phpを利用するためのメソッド
			# Example => APIConnector.json_get({Req: "TitleSearch", Title: "ご注文はうさぎですか？", Limit: 15})
			def json_get(query_params={})
				begin
					connection.get(json_path, query_params)
				rescue => e
					puts "#{e.message}"
					exit
				end
			end

			private
			def connection
				connection ||= Faraday::Connection.new(url: url) do |c|
					c.request :url_encoded
					c.response :logger
					c.adapter :net_http
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
