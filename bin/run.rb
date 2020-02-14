require_relative '../config/environment'
require 'tty-prompt'
require 'pry'
require 'rest-client'
require 'json'
require 'rainbow'

system 'clear'

cli = CommandLine.new()

cli.welcome
cli.introduction
cli.menu_controller
