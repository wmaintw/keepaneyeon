require 'sinatra'
require 'sinatra/json'
require "sinatra/cross_origin"
require './parse-content.rb'

set :bind, '0.0.0.0'

register Sinatra::CrossOrigin

configure do
  enable :cross_origin
end

get '/' do
  'Hello world!'
end

get '/kindle-instock' do
  json kindle_instock?
end

get '/something-instock' do
  json something_instock?
end

options "*" do
  response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
  200
end
