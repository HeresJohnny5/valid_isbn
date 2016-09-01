def isbn_number(string)

	string_to_array = string.split("")
	# Converted string into an array of one character elements
	# This is so I could iterate through each character removing spaces and dashes below

	remove_from_array = [" ", "-"]
	remove_from_array.each do |symbol|
		string_to_array.delete(symbol)
	end
	# Removed spaces and dashes from the array

	array_to_string = string_to_array.join
	# Converted array to a string
	# This is so the Regex Expression would function correctly
	# /[^0123456789]/ - Looks for any character except what's in the array  

	if array_to_string.length > 9 # Conditional if the user inputs more than 9 characters
		p "Please enter 9 numeric characters."
	else
		if array_to_string =~ /[^0123456789]/ # Conditional if the user inputs any character except numeric
			p "Please input only numeric characters."
		else
			string_to_array = array_to_string.split("") # Convert the string back to an array for iteration reasons

			return_array = []
			string_to_array.each_with_index do |value, index|
				if index < 9
					return_value = (index + 1) * value.to_i
					return_array.push(return_value)
				end
			end
			# The check digit for ISBN-10 is calculated by multiplying each digit by its position 
			# For example, 1 x 1st digit, 2 x 2nd digit, etc.)

			array_sum = return_array.inject(&:+)
			# Summing up the array using the inject method 

			sum_modulos_eleven = array_sum % 11

			if sum_modulos_eleven == 10
				final_isbn = string_to_array.push("X")
			else
				final_isbn = string_to_array.push(sum_modulos_eleven.to_s)
			end
			p final_isbn

		end
	end
end

# Valid ISBN
isbn_number("047195869") # "0471958697"
isbn_number("0-321-14653-") # "0-321-14653-0"
isbn_number("87719586") # "877195869"

# Invalid ISBN
isbn_number("478047005902") # Fails - "Please enter 9 numeric characters."
isbn_number("0-321@14653-") # Fails - "Please enter 9 numeric characters."
isbn_number("877195x86") # Fails - "Please input only numeric characters."