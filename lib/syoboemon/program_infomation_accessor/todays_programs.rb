# 
# Syoboemon::ProgramInfomationAccessor::TodaysPrograms
# 

# 取得した現在時刻から1日分の放送番組に関する情報を参照するためのクラス

class Array
	def remove_other_than_animetion
		self.reject {|p| p.category != "1"}
	end
end

module Syoboemon
	module ProgramInfomationAccessor
		class TodaysPrograms
			attr_reader :programs
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

			# # 自身のメンバの配列の要素を分解し、各配列の要素を保持した構造体を要素とする新しい配列を返す
			# # => Struct([a1, a2...], [b1, b2...], [c1, c2...]...) => [Struct(a1, b1, c1), Struct(a2, b2, c2)...]
			# def convert_to_array_of_structure_from_self
			# 	self.titles.size.times do |num|
			# 		struct = Struct.new(:airtime, :title, :subtitle, :broadcaster, :title_id, :category)
			# 		struct_params = self.members.map {|sym| self.send("#{sym}")[num]}
			# 		struct.members.each.with_index {|sym, i| struct.send("#{sym}=", struct_params[i])}
			# 		@program_infos << struct
			# 	end
			# end

			def split_title_params
				program_params = @todays_programs.map do |p|
					t = p.split("-")
					hash = { airtime: t[0], title: t[1], subtitle: t[2], broadcaster: t[3], title_id: t[4], category: t[5] }
				end
				return program_params
			end
		end
	end
end
