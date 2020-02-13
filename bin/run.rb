require_relative '../config/environment'
require 'tty-prompt'
require 'pry'
require 'rest-client'
require 'json'


# main = CommandLineo.new()
# main.get_attendee_name
# main.main_menu_options

cli = CommandLine.new()
cli.introduction
cli.menu_controller




# cli.order_lookup

