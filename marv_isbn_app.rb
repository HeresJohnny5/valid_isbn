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

def string_remove_space_or_dash(string)
	remove = [" ", "-"]

	remove.each do |symbol|
		string.delete! symbol  
	end
	string	
end

def multiply_the_element_by_position_and_return_array_of_numbers(array_of_strings)
	returned_array = []
	
	array_of_strings.each_with_index do |value, index|
		if index < 9
			return_value = value.to_i * (index + 1)
			returned_array.push(return_value)
		end
	end
	returned_array
end

def adding_array(array)
	array.inject(:+)
end

def modulos_of_sum(sum)
	checksum = sum % 11

	if checksum == 10
		"X"
	else
		checksum
	end

end

def convert_x(isbn_number_array)
    #if last digit of isbn10 is x then x = "10"
    #take in array and return array that updates x or X to 10
    if isbn_number_array[9] == "x" || isbn_number_array[9] == "X"
    isbn_number_array[9] = "10"
    end
  isbn_number_array
end

def valid_10_digit_isbn?(array_of_nums)
	array = []

	array_of_nums.each do |value|
		array.push(value.to_i)
	end
	sum = 0

	array.each_with_index do |value, index|
		if index < 9
			sum += (value * (index + 1))
		end
	end

	check_digit = sum%11

	if check_digit == array[9]
		true
	else
		false
	end
end

def only_numbers_in_my_array?(isbn_array)
	nums_only = isbn_array.join("")
	true if nums_only =~ /\D/
end

def valid_13_digit_isbn?(isbn_array_of_nums)
	array = []
	isbn_array_of_nums.each do |value|
		array.push(value.to_i)
	end
	
	sum = 0
	check_digit = 0

	array.each_with_index do |value, index|
		if index < 12
			if index%2 == 0
				sum += value * 1
			else 
				sum += value * 3
			end
		end
	end

	sum = sum%10
	check_digit = (10 - sum)
		if check_digit == 10
			check_digit = 0
		end
		if array[12] == check_digit
			true
		else
			false
		end
end

def valid_isbn_10_or_13(isbn_string_of_nums)
	no_invalid_char = string_remove_space_or_dash(isbn_string_of_nums)
	isbn_array = string_to_array(no_invalid_char)
	
	if  isbn_array.length == 10
		x_equals_10 = convert_x(isbn_array)
		if only_numbers_in_my_array?(x_equals_10) == false
			false
		else
			valid_10_digit_isbn?(x_equals_10)
		end
	elsif isbn_array.length == 13
		
		if only_numbers_in_my_array?(isbn_array) == false
			false
		else
			valid_13_digit_isbn?(isbn_array)
		end
	else
		false
	end
end