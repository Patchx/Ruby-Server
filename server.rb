require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'active_support/all'

get '/?' do
	response = HTTParty.get("http://finance.yahoo.com/q?s=#{params[:stock]}")
	dom = Nokogiri::HTML(response.body)
	if params[:stock] == nil
		return "Welcome to the stock ticker scrapper. Please enter the stock data into your brower in the following format:  localhost:4567/?stock=AAPL"
	end
	ticker_span = dom.xpath("//span[@id='yfs_l84_#{params[:stock].downcase}']")
	if ticker_span.children[0] == nil
		return "Sorry, I don't have a record of that stock"
	end
	price = ticker_span.children[0].content.to_f.to_s(:currency)
	return "Current stock price for #{params[:stock]} is #{price}"
end

get '/sinatra' do
	"<h1>Sinatra Rocks!</h1>"
end

get '/ruby' do
	redirect './ruby-logo.png'
end
