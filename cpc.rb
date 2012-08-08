#!/usr/bin/env ruby
# Notes:  This file is customized to work with gems under development.  
# It is expected to be run from the root of your project directory.  
# It expects there to be a lib folder and within that folder, an .rb file with the 
# same name as your project folder's name.  From there you can work with your 
# library right on the console.

#$: << File.dirname(__FILE__) + "/lib"
$: <<  Dir.getwd + "/lib"

if e = ARGV.shift
  ENV['RACK_ENV'] = e
end

project_name = File.basename(Dir.getwd)

require "#{project_name}.rb"
#require 'application.rb'
require 'irb'

puts "CooperPress Console"

IRB.start