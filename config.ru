require 'rubygems'
require 'bundler/setup'
require './app'

map Sinatra::Application.assets_prefix do
  run Sinatra::Application.sprockets
end

run Sinatra::Application
