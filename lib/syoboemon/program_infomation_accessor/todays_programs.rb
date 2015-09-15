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
				@todays_programs = parsed_happymapper_obj
				self.init_struct_params
				self.set_up_attribute_values
			end

			private 
			def set_up_attribute_values
			end

			def connect_titles
			end

			def split_title_params
				@todays_programs.each do |p|
					title_params = p.title.split("-")
					airtimes << title_params[0].to_s
					titles << title_params[1].to_s
					subtitles << title_params[2].to_s
					broadcasters << title_params[3].to_s
					title_ids << title_params[4].to_s
					categories << title_params[5].to_s
				end
			end

			# 継承したStructのメンバを空の配列で初期化する
			def init_struct_params
				self.airtimes = []
				self.titles = []
				self.subtitles = []
				self.broadcasters = []
				self.title_ids = []
				self.categories = []
			end
		end
	end
end
