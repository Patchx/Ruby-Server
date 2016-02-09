require 'sinatra'

get '/' do
	"Hello world"
end

get '/sinatra' do
	"<h1>Sinatra Rocks!</h1>"
end

get '/ruby' do
	redirect './ruby-logo.png'
end