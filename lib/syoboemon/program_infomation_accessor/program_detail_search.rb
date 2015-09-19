# 
# Syoboemon::ProgramInfomationAccessor::ProgramDetailSearch
# 

# json.phpとdb.phpを使って検索した番組に関する情報を参照するためのクラス

module Syoboemon
	module ProgramInfomationAccessor
		class ProgramDetailSearch < Struct.new(:title, :title_id, :staffs, :casts, :opening_themes, :ending_themes)
			def initialize(parsed_happymapper_object)
    		@results_of_program = parsed_happymapper_object
    		set_up_parameter_of_structure_members
  		end

  		private
  		def set_up_parameter_of_structure_members
  			self.title = @results_of_program.Title
  			self.title_id = @results_of_program.TID
        self.staffs = 
  		end

      def split_element_of_comment
        split_pattern = /"*スタッフ"|"*キャスト"|("オープニング"|"エンディング")*/
        comment = @results_of_program.Comment
        staff_and_casts = comment.split("¥n").map {|elem| elem.match()}
      end
		end
	end
end
