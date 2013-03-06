require 'sinatra'
require 'sprockets'
require 'coffee-script'
require 'sass'
require 'haml'

set :sprockets, Sprockets::Environment.new(settings.root)
set :assets_prefix, '/assets'
set :digest_assets, false

%w(assets/javascripts assets/stylesheets).each do |path|
  settings.sprockets.append_path(path)
end

get '/' do
  redirect to('https://minefold.com/developers'), 301
end
