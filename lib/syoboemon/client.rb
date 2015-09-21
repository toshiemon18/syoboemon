# 
# Syoboemon::Client
# 

module Syoboemon
  class Client
  	def today_programs(user_name="")
  		usr = user_name.to_s
  		query_params = QueryGenerator::TodaysPrograms.new(usr).generate_query
  		api_response = APIConnector.get_rss2(query_params)
  		return ProgramInfomationAccessor::TodaysPrograms.new(APIResponseParser::Item.parse(api_response))
  	end

  	def search_program(title_str="")
  		title = title_str.to_s
  		tid = fetch_title_id(title)
  		query_params = QueryGenerator::ProgramDetailSearch::DB.new(tid.to_s)
      api_response = APIConnector.get_db(query_params)
      return ProgramInfomationAccessor::ProgramDetailSearch.new(APIResponseParser::TitleItem.parse(api_response))
  	end

  	private
  	def fetch_title_id(title_str="")
  		title = title_str.to_s
  		query_params = QueryGenerator::ProgramDetailSearch::Json.new(title).generate_query
  		api_response = APIConnector.get_json(query_params)
  		return APIResponseParser::Json.new(api_response).parse
  	end
  end
end
