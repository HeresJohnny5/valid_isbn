require "sinatra"
require_relative "marv_isbn_app.rb"

get "/" do
	erb :get_isbn
end

post "/isbn_number" do
	number = params[:user_input]
	test = valid_isbn_10_or_13(number)

	if test == true 
		test = "Valid"
	else
		test = "Invalid"
	end

	"ISBN #{number} is #{test}"
end