require_relative "marv_isbn_app.rb"
require "minitest/autorun"

class TestValidIsbn < Minitest::Test

	def test_empty_string_returns_false()
		assert_equal(false, valid_isbn_length?(""))
	end

	def test_valid_10_digit_isbn_string_returns_true()
		assert_equal(true, valid_isbn_length?("0471958697"))
	end

	def test_an_invalid_10_digit_isbn
		skip("skip")
		assert_equal(false, test_if_10_digit_isbn_is_real("0471958999"))
	end
end

class TestConvertStringToArray < Minitest::Test

	def test_empty_string_returns_empty_array
		assert_equal([], string_to_array(""))
	end

	def test_string_returns_returns_array
		assert_equal(["1","2","3","4","5"], string_to_array("12345"))
	end
end

class TestToCheckForDashOrSpace < Minitest::Test
	
	def test_string_with_space_returns_string_with_no_space
		assert_equal("12345", string_remove_space_or_dash("123 45"))
	end

	def test_string_with_dash_returns_string_with_no_dash
		assert_equal("12345", string_remove_space_or_dash("123-45"))
	end

	def test_string_with_dash_and_space
		assert_equal("0123456789", string_remove_space_or_dash(" -01-2 3  4-- -56789"))
	end
end

class TestTheSumOfIsbn < Minitest::Test

	def test_the_sum_of_an_isbn
		assert_equal([7, 8, 6, 4, 15, 54, 28, 56, 54], multiply_the_element_by_position_and_return_array_of_numbers(["7","4","2","1","3","9","4","7","6","1"]))
	end

	def test_adding_numbers_in_array
		assert_equal(232, adding_array([7, 8, 6, 4, 15, 54, 28, 56, 54]))
	end

	def test_modulos_of_sum
		assert_equal(1, modulos_of_sum(232))
	end

	def test_modulos_of_sum_equals_x
		assert_equal("X", modulos_of_sum(21))
	end
end

class TestWithMarv < Minitest::Test

	def test_for_x_in_array
		 assert_equal(["0","8","0","4","4","2","9","5","7","10"], convert_x(["0","8","0","4","4","2","9","5","7","x"]))
	end

	def test_for_10_digit_math
        assert_equal(true, valid_10_digit_isbn?(["0","4","7","1","9","5","8","6","9","7"]))
        assert_equal(false, valid_10_digit_isbn?(["1","4","7","1","9","5","8","6","9","7"]))
        assert_equal(true, valid_10_digit_isbn?(["8","7","7","1","9","5","8","6","9","10"]))
    end

    def test_for_non_numeric_characters_in_my_array?
    # true if anything other than digit/can i include this in disallowed function??
    assert_equal(nil, only_numbers_in_my_array?(["1","2","3","4","5","6","7","8","9","0"]))
    assert_equal(true, only_numbers_in_my_array?(["1","2","3","?","5","6","7","8","9","0"]))
    assert_equal(true, only_numbers_in_my_array?(["n","2","3","x","5","p","7","8","9","0"]))
    end

    def test_for_thirteen_character_math
    assert_equal(true, valid_13_digit_isbn?(["9","7","8","0","1","5","6","0","2","7","3","2","8"]))#true isbn
    assert_equal(false, valid_13_digit_isbn?(["9","7","8","0","1","5","6","0","2","7","3","2","9"]))
    end
end

class Test_final_function < Minitest::Test

	def test_10_and_13_digit_strings
		assert_equal(true, valid_isbn_10_or_13("9780156027328"))
		assert_equal(false, valid_isbn_10_or_13("9780156027320"))
		assert_equal(true, valid_isbn_10_or_13("9-- 7- 80-- 1- -5 -60- -273- 28"))
		assert_equal(false, valid_isbn_10_or_13("97801A6027328"))
		assert_equal(true, valid_isbn_10_or_13("0471958697"))
		assert_equal(false, valid_isbn_10_or_13("0471958690"))
		assert_equal(true, valid_isbn_10_or_13("04- -719-- - 58- 697"))
		assert_equal(true, valid_isbn_10_or_13("877195869x"))
		assert_equal(true, valid_isbn_10_or_13("87- -7195- 86- 9X"))
		assert_equal(false, valid_isbn_10_or_13("877195A69x"))
	end
end