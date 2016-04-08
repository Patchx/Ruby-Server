require 'sinatra'
require 'httparty'
require 'nokogiri'
require 'active_support/all'

get '/?' do
	"<h1>Welcome to Robert's Test Server</h1> \n
	<p>Things to type: \nresume \nstocks \nsinatra \ntest</p>"
end

get '/resume' do
	redirect './index.html'
end

get '/stocks' do

	response = HTTParty.get("http://finance.yahoo.com/q?s=#{params[:stock]}")
	dom = Nokogiri::HTML(response.body)
	if params[:stock] == nil
		return "<h1>Welcome to the stock ticker scrapper. Please enter the stock data into your brower in the following format:  localhost:4567/?stock=AAPL</h1>"
	end
	ticker_span = dom.xpath("//span[@id='yfs_l84_#{params[:stock].downcase}']")
	if ticker_span.children[0] == nil
		return "<h2>Sorry, I don't have a record of that stock</h2>"
	end
	price = ticker_span.children[0].content.to_f.to_s(:currency)
	return "<h2>Current stock price for #{params[:stock]} is #{price}</h2>"

end

get '/sinatra' do
	"<h1>Sinatra Rocks!</h1>"
end

get '/test' do
	redirect './test.html'
end
