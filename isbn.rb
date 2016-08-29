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
	if string.include?(" ") 
		string.delete(" ",)
	elsif string.include?("-")
		string.delete("-")
	else
		string
	end
end