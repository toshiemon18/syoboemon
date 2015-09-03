$:.unshift File.dirname(__FILE__)

# ruby gems
require 'rubygems'
require 'faraday'
require 'happymapper'

# syoboemon ruby files
# version file
require "./syoboemon/version"
# Syoboemon::Client class
require "./syoboemon/client"
# Syoboemon::Connector
require "./syoboemon/connector"
# Syoboemon::QueryBuilder module
require "./syoboemon/query_builder/base"
require "./syoboemon/query_builder/program_basic_data"
require "./syoboemon/query_builder/voice_actors_list"
# Syoboemon::Parser module
require "./syoboemon/parser/base"

module Syoboemon

end
