require 'happymapper'
require 'faraday'

user_name = ARGV[0]
module TestCode
	class QueryDataParser
		include HappyMapper

		tag "item"
		element :item, Item
	end

	class Item
		include HappyMapper

		tag "item"
		element :title, String
		element :link, String
		element :pubDate, DateTime
		element :description, String
end
end

url = "http://cal.syoboi.jp"
rss_path = "/rss2.php"

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

response = connection.get(rss_path, {
	user: "#{user_name}",
	filter: "0",
	count: "3000",
	days: "1",
	titlefmt: "$(StTime) $(ShortTitle) $(SubTitleB) $(ChName) $(TID)"
})
query_data = TestCode::Item.parse(response.body)
query_data.map { |e| e.title }
query_data.each do |e|
	puts e.title
end
