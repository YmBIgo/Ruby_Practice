# if col_number is ...
#   0 => 1 ~ 15
#   1 => 16 ~ 30
#   ...
#   4 => 61 ~ 75

def create_col(col_number)
	result_col_array = []
	while (true) do
		random_number = rand(1..15)
		current_number = random_number + col_number*15
		if result_col_array.include?(current_number)
			next
		end
		result_col_array.push(current_number)
		if result_col_array.length == 5
			break
		end
	end
	return result_col_array
end

result_array_before = []
result_array = Array.new(5) { Array.new(5, 0) }

0.upto(4) do |count|
	bingo_col_array = create_col(count)
	result_array_before.push(bingo_col_array)
end

for index_1 in 0...result_array_before.length do
	before_array = result_array_before[index_1]
	index_2 = 0
	before_array.each do |before_array_ele|
		result_array[index_2][index_1] = before_array_ele
		index_2 += 1
	end
end

print " B |  I |  N |  G |  O |\n"
result_array.each do |result_row|
	result_row.each do |result_num|
		print_num = ""
		if result_num > 9
			print_num = result_num.to_s + " | "
		else
			print_num = " " + result_num.to_s + " | "
		end
		print (print_num)
	end
	print "\n"
end