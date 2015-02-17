require 'slim'
require 'sinatra'

set :port, 8080

get '/' do
  slim 'div#chart_div style="width:400; height:300"'
end

