require 'rubygems'
require File.join(File.dirname(__FILE__), 'server.rb')
configure :production do
  require 'newrelic_rpm'
end
run RockPaperScissors
