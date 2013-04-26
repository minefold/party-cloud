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

configure :production do
  require 'bugsnag'
  require 'librato/rack'
  require 'rack/ssl'

  Bugsnag.configure do |config|
    config.api_key = ENV['BUGSNAG_API_KEY']
    config.project_root = settings.root
  end

  enable :raise_errors

  use Bugsnag::Rack
  use Librato::Rack
  use Rack::SSL
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
