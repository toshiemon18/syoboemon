module Syoboemon
	module Parser
		class Base
			include HappyMapper

			def initialize(target_tag_name="", elements={})
				configure_target_tag(target_tag_name) unless target_tag_name.empty?
				expand_analysis_target_elements(elements)
			end

			private

			def configure_target_tag(tag_name)
				tag tag_name
			end
				
			end

			def expand_analysis_target_elements(elements)
				elements.each do |key, val|
					element key.to_sym, val
				end
			end

			def inspect_type_name(type_name)
				TYPES = {
					"String" => String,
					"Float" => Float,
					"Integer" => Integer,
					"Boolean" => Boolean,
					"Time" => Time,
					"Date" => Date,
					"DateTime" => DateTime
				}
				TYPES.each { |k,v| return v if /#{type_name}/i === k }
			end
		end
	end
end