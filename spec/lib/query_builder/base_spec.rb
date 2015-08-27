require './../../spec_helper'
require './../../../lib/syoboemon/query_builder/base'

describe "Base" do
	it "is named builder" do
		builder = Syoboemon::QueryBuilder::Base.new
		expect(builder).to eq 'builder'
	end
end