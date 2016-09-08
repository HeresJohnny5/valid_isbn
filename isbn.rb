def valid_isbn_length?(num)
	if num.length == 10 || num.length == 13
		true
	else
		false
	end
end

def string_to_array(string)
	string.split("")
end

def string_removes_space_or_dash(string)
	remove = [" ", "-"]

	remove.each do |symbol|
		string.delete! symbol 
	end
	string

end

def multiply_the_element_by_position_and_return_array_of_numbers(array_of_number_of_strings)
	# ["7", "4", "2", "1", "3", "9", "4", "7", "6", "1"] - array_of_number_of_strings
	# [7, 8, 6, 4, 15, 54, 28, 56, 54] - return_array
	return_array = []

	array_of_number_of_strings.each_with_index do |value, index|
		if index < 9
			return_value = (index + 1) * value.to_i
			return_array.push(return_value)
		end
	end
	return_array

end

def sum_numbers_in_array(array)
	array.inject(:+)
end

def modulos_of_sum(sum)
	check_sum = sum % 11

	if check_sum == 10
		"X"
	else
		check_sum
	end
end

