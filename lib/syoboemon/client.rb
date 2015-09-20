# 
# Syoboemon::Client
# 

module Syoboemon
  class Client
  	def today_programs(user_name="")
  		usr = user_name.to_s
  		query_params = QueryBuilder::TodaysPrograms.new(usr).generate_query
  		api_responce = APIConnector.get_rss2(query_params)
  		return ProgramInfomationAccessor::TodaysPrograms.new(APIResponse::TodaysPrograms.parse(api_responce))
  	end

  	def search_program(title="")
  		
  	end
  end
end
