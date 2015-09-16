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
				self.init_structure_parameters
				self.set_up_attribute_values
			end

			private 
			def set_up_attribute_values
			end

			# connection_title_and_subtitle_flag => trueの場合のみ呼ばれる
			# titlesとsubtitlesの各要素を連結し、新しいtitlesの要素として格納する
			def connect_title_and_subtitle
				titles_tmp = self.titles
				subtitles_tmp = self.subtitles
				new_titles = titles_tmp.map.with_index do |title, i|
					subtitle = subtitles_tmp[i]
					subtitles_tmp[i] = nil
					new_title = "#{title} #{subtitle}"
				end
				subtitles_tmp.reject! {|e| e.nil? }
				self.subtitles = subtitles_tmp
				self.titles = new_titles
			end

			def split_title_params
				program_params = {airtimes: [], titles: [], subtitles: [], broadcasters: [], title_ids: [], categories: [] }
				@todays_programs.each do |p|
					splited_title_strings = p.title.split("-")
					program_params.each_value.with_index { |val, i| val << splited_title_strings[i] }
				end
				return program_params
			end

			# 継承したStructのメンバを空の配列で初期化する
			def init_structure_parameters
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
