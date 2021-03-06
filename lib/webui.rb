require 'slim'
require 'sinatra'
require 'sinatra/json'
require_relative 'models/notifications'

set :bind, @config['webui_host']
set :port, @config['webui_port']

get '/' do
  slim :index
end

get '/data/:start_at/:finish_at/:dt' do
  start_at = params[:start_at] ? Time.parse(params[:start_at]) : 3.seconds.ago
  finish_at = params[:finish_at] ? Time.parse(params[:finish_at]) : 0.seconds.ago
  dt = params[:dt] ? params[:dt].to_i.seconds : 1.second
  notifications = Notifications.new dt: dt, start_at: start_at, finish_at: finish_at 
  json notifications.data
end

