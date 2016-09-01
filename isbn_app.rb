require "sinatra"
require_relative "isbn_app_one_function.rb"

get "/" do
	erb :get_isbn
end

post "/isbn_number" do
	number = params[:user_input]
	test = isbn_number(number)
end