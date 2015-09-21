$:.unshift File.dirname(__FILE__)

# ruby gems
require 'rubygems'
require 'faraday'
require 'happymapper'
require "json"

# syoboemon ruby files
require "./syoboemon/version" # Syoboemon::VERSION
require "./syoboemon/client" # Syoboemon::Client
require "./syoboemon/api_connector" #Syoboemon::APIConnector
# Syoboemon::APIResponceParser
require "./syoboemon/api_responce_parser/api_response_parser"
# Syoboemon::QueryGenerator
require "./syoboemon/query_generator/program_detail_search"
require "./syoboemon/query_generator/todays_programs"
# Syoboemon::ProgramInfomationAccessor
require "./syoboemon/program_infomation_accessor/program_detail_search"
require "./syoboemon/program_infomation_accessor/todays_programs"
