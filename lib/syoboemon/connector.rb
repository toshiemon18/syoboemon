module Syoboemon
	module Connector
		URL			= "http://cal.syoboi.jp"
		RSS2_PATH	= "/rss2.php"
		DB_PATH		= "/db.php"
		JSON_PATH	= "/json.php"

		def rss2_get(query)
			connection.get(rss2_path, query)
		end

		def db_get(query)
			connection.get(db_path, query)
		end

		def json_get(query)
			connection.get(json_path, query)
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