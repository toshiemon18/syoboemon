require 'json'
require 'faraday'

url = "http://cal.syoboi.jp"
json_path = "/json.php"

program_title = "冴えない彼女の育てかた"

begin
	connection ||= Faraday::Connection.new(url: url) do |c|
		c.request		:url_encoded
		c.response	:logger
		c.adapter		:net_http
		c.response	:raise_error
	end
rescue => e
	puts "Connection error #{e}"
end

params = {
	Req: "TitleSearch",
	Search: "#{program_title}",
	Limit: 15
}

response = connection.get(json_path, params)
body = JSON.parse(response.body)
puts body["Titles"].keys[0]

=begin
	responce.bodyの中身は
	{Titles : {"3141" : {
				"TID" : "3141",
				"Title" : "ストライク・ザ・ブラッド",
				"ShortTitle" : "",
				"TitleYomi" : "ストライク・ザ・ブラッド",
				"TitleEN" : "STRIKE THE BLOOD",
				"Cat" : "10",
				"FirstCh" : "AT-X",
				"FirstYear" : "2013",
				"FirstMonth" : "10",
				"FirstEndYear" : "2014",
				"FirstEndMonth" : "3",
				"TitleFlag" : "0",
				"Comment" : "",
				"Search" : ""
			}
		}
	}
	みたいな感じになってる。
	Titlesの下でTIDが重複しているけどあまり問題無さそう
=end
