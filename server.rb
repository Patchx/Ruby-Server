require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'active_support/all'

get '/' do
	response = HTTParty.get('http://finance.yahoo.com/q?s=AAPL')
	dom = Nokogiri::HTML(response.body)
	ticker_span = dom.xpath("//span[@id='yfs_l84_aapl']")
	price = ticker_span.children[0].content.to_f.to_s(:currency)
	return "Apple's current stock price is #{price}"
end

get '/sinatra' do
	"<h1>Sinatra Rocks!</h1>"
end

get '/ruby' do
	redirect './ruby-logo.png'
end
