# 
# Syoboemon::ProgramInfomationAccessor::ProgramDetailSearch
# 

# json.phpとdb.phpを使って検索した番組に関する情報を参照するためのクラス

module Syoboemon
	module ProgramInfomationAccessor
		class ProgramDetailSearch < Struct.new(:title, :title_id, :opening, :ending, :staffs, :casts)
			def initialize(parsed_happymapper_object)
    		@results_of_program = parsed_happymapper_object
    		set_up_params_of_structure_members
  		end

  		private
  		def set_up_params_of_structure_members
        program_params = split_params_of_comment
  			self.title = @results_of_program.Title
  			self.title_id = @results_of_program.TID
        self.staffs = set_up_staff_or_cast_params(program_params.first) # Set staff
        self.opening = set_up_music_params(program_params.map {|str| str.match(/オープニングテーマ.+/m)}.reject(&:nil?))
        self.ending = set_up_music_params(program_params.map {|str| str.match(/エンディングテーマ.+/m)}.reject(&:nil?))
        self.casts = set_up_staff_or_cast_params(program_params.last)
  		end

      # 取得した番組情報のComment要素よりスタッフ、キャスト、OP、EDのデータを含む文字列を配列にして返す
      # 配列の添字には以下の対応がある
      # 0 => スタッフ（原作原画、監督等）
      # 1〜 => オープニングテーマ（複数ある場合はその数だけ）
      # 〜(n-1) => エンディングテーマ（複数ある場合はｓの数だけ）
      # n => キャスト（各キャラクターの配役）
      def split_params_of_comment
        split_pattern = /スタッフ.+|キャスト.+|(オープニング|エンディング).+/m
        comment = @results_of_program.Comment
        program_detail_params = comment.split("*").reject {|e| not e.match(split_pattern)}
        return program_detail_params
      end

      # スタッフまたはキャストのリストを返す
      def set_up_staff_or_cast_params(string_of_staff_or_cast)
        string_of_staff_or_cast.split(/$./m).map do |s|
          p = s.match(/:(.+?):(.+)/)
          str = "#{p[1]}:#{p[2]}" unless p.nil?
        end
      end

      # OPまたはEDのリストを返す
      def set_up_music_params(string_of_music=[])
        string_of_music.map do |str|
          op_param = str.to_s.split(/$./m).map do |line|
            match_data = line.match(/.+「(.+)」|:.*歌:(.+)/)
            str =  match_data.to_a.reject(&:nil?).last unless match_data.nil?
          end.reject(&:nil?).join(":")
        end
      end
		end
	end
end