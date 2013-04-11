require 'sinatra'
require 'sprockets'
require 'sass'

configure do
  set :server, :puma
  set :port, ENV['PORT']

  sprockets = Sprockets::Environment.new(settings.root)

  sprockets.append_path('app/assets/images')
  sprockets.append_path('app/assets/javascripts')
  sprockets.append_path('app/assets/stylesheets')

  set :sprockets, sprockets
  set :views, File.join(settings.root, 'app', 'views')
  set :erb, escape_html: true
end

# Router

get '/assets/*' do
  env['PATH_INFO'].sub!(%r{^/assets}, '')
  settings.sprockets.call(env)
end

get '/docs/api' do
  erb :api
end

get '/' do
  erb :index
end
