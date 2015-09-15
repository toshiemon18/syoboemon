# 
# Syoboemon::ProgramInfomationAccessor::TodaysPrograms
# 

# 現在時刻から1日分の放送番組に関する情報を参照するためのクラス

module Syoboemon
	module ProgramInfomationAccessor
		class TodaysPrograms < Struct.new(:airtimes, :titles, :subtitles, :broadcasters, :title_ids, :categories)
			attr_accessor :connection_title_and_subtitle_flag

			def initialize(parsed_happymapper_obj)
				@connection_title_and_subtitle_flag = true
				@todays_info = parsed_happymapper_obj
				self.set_up_attribute_values
			end

			private 
			def set_up_attribute_values
			end

			def connect_titles
			end
		end
	end
end
