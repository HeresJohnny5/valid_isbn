=begin
	Create a program that will verify if a string is a valid ISBN number (see requirements below).
	Use a TDD approach. This is a big exercise - break it down into chunks!	
=end

require_relative "isbn.rb"
require "minitest/autorun"

class ValidIsbn < Minitest::Test

	def test_empty_string_returns_false()
		assert_equal(false, valid_isbn?(""))
	end

	# def test_enters_string_returns_false()
	# 	assert_equal(false, valid_isbn?(""))
	# end

end