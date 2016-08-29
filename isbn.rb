def valid_isbn_length?(num)
	if num.length == 10
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

def multiply_the_element_by_position_and_sum(array_of_number_of_strings)
	# ["7", "4", "2", "1", "3", "9", "4", "7", "6", "1"]
	empty_array = []

	array_of_number_of_strings.each_with_index do |value, index|
		if index < 9
			return_value = (index + 1) * value.to_i
			empty_array.push(return_value)
		end
	end
	empty_array

end

def sum_numbers_in_array(array)
	empty_array = []
	empty_array.push(array.inject(:+))
end