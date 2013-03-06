require 'sinatra'

configure do
  set :server, :puma
  set :port, ENV['PORT']
end

get '*' do
  redirect to('https://minefold.com/developers'), 301
end
