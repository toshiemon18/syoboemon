# 
# Syoboemon::ProgramInfomationAccessor::TodaysPrograms
# 

# 取得した現在時刻から1日分の放送番組に関する情報を参照するためのクラス

class Array
	def remove_other_than_anime
		self.reject {|p| p.category.match(/0|2|3|6/)}
	end

	def remove_other_than_radio
		self.reject {|p| not p.category.match(/2/)}
	end
end

module Syoboemon
	module ProgramInfomationAccessor
		class TodaysPrograms
			attr_accessor :programs
			def initialize(parsed_happymapper_object)
				@todays_programs = parsed_happymapper_object.map(&:title)
				@programs = set_up_structures_of_program_infomation
			end

			# connection_title_and_subtitle_flag => trueの場合のみ呼ばれる
			# titlesとsubtitlesの各要素を連結し、新しいtitlesの要素として格納する
			def connect_title_and_subtitle
				programs_tmp = self.programs
				new_programs = programs_tmp.map do |p|
					subtitle = p.subtitle
					p.subtitle = nil
					p.title += "#{subtitle}"
				end
				self.programs = new_programs
			end

			private
			def set_up_structures_of_program_infomation
				struct_params = split_title_params
				program_structure_ary = struct_params.map do |p|
					struct = Struct.new(:airtime, :title, :subtitle, :broadcaster, :title_id, :category)
					struct.new(p[:airtime], p[:title], p[:subtitle], p[:broadcaster], p[:title_id], p[:category])
				end
				return program_structure_ary
			end

			def split_title_params
				program_params = @todays_programs.map do |p|
					t = p.split("-")
					hash = {airtime: t[0], title: t[1], subtitle: t[2], broadcaster: t[3], title_id: t[4], category: t[5]}
				end
				return program_params
			end
		end
	end
end
