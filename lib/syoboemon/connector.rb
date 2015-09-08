#
# Syoboemon::Connector module
#

# しょぼいカレンダーAPIを利用するためのモジュール

require "rubygems"
require "faraday"

module Syoboemon
	module Connector
		URL			= "http://cal.syoboi.jp"
		RSS2_PATH	= "/rss2.php"
		DB_PATH		= "/db.php"
		JSON_PATH	= "/json.php"

		class << self
			def rss2_get(query_params={})
				connection.get(rss2_path, query_params)
			end

			def db_get(query_params={})
				connection.get(db_path, query_params)
			end

			def json_get(query_params={})
				connection.get(json_path, query_params)
			end

			private
			def connection
				connection ||= Faraday::Connection.new(url: url) do |c|
					c.request		:url_encoded
					c.response	:logger
					c.adapter		:net_http
					c.response	:raise_error
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