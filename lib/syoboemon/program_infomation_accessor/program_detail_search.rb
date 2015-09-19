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
        staff_and_cast = split_params_of_comment
  			self.title = @results_of_program.Title
  			self.title_id = @results_of_program.TID
        self.staffs = set_up_staff_or_cast_params(staff_and_cast[0]) # Set staff
  		end

      # 取得した番組情報のComment要素よりスタッフ、キャスト、OP、EDのデータを含む文字列を配列にして返す
      # 配列の添字には以下の対応がある
      # 0 => スタッフ（原作原画、監督等）
      # 1〜 => オープニングテーマ（複数ある場合はその数だけ）
      # 〜(n-1) => エンディングテーマ（複数ある場合はｓの数だけ）
      # n => キャスト（各キャラクターの配役）
      def split_params_of_comment
        split_pattern = /"*スタッフ"|"*キャスト"|("オープニング"|"エンディング")*/
        comment = @results_of_program.Comment
        program_detail_params = comment.split(/"*".+/).map {|elem| elem.match(split_pattern)}
        return program_detail_params
      end

      # スタッフまたはキャストのリストを返す
      def set_up_staff_or_cast_params(string_of_staff_or_cast)
        string_of_staff.split("¥n").map {|s| s.slice!(0)}
      end

      # OPまたはEDのリストを返す
      def set_up_music_params(string_of_music=[])
        string_of_op.map {|str| op_param = str.split("¥n").map {|line| line.match(/(.+「|:.*歌:)(.+)/)[2]}.join(" : ")}
      end
		end
	end
end