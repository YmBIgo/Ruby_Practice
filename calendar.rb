require "date"

print "Please input year.  "
year_input = gets.chomp!.to_i
print "Please input month.  "
month_input = gets.chomp!.to_i

if year_input == 0 || month_input == 0
	print "Please enter correct words..."
	exit
end

if month_input > 12 || month_input < 0
	print "Please enter correct month..."
	exit
end

# year check 
if year_input >= 10000 || year_input < 1970
	print "Please enter correct year..."
	exit
end

current_month_str = year_input.to_s + "-" + month_input.to_s + "-1"
next_month_str = ""
if (month_input == 12)
	next_month_str = (year_input+1).to_s + "-1-1"
else
	next_month_str = year_input.to_s + "-" + (month_input+1).to_s + "-1"
end

puts ""
print "Su Mo Tu We Th Fr Sa\n"

current_month_first_day = Date.parse(current_month_str)
next_month_first_day = Date.parse(next_month_str)
current_month_last_day = next_month_first_day - 1
blank_dates = current_month_first_day.wday
1.upto(blank_dates) do |num|
	print("   ")
end
week_blank = blank_dates

(current_month_first_day..current_month_last_day).each do |date|
	if week_blank == 7
		print "\n"
		week_blank = 0
	end
	print_date = ""
	if (date.day >= 10)
		print_date = " " + date.day.to_s
	else 
		print_date = " " + date.day.to_s + " "
	end
	print print_date
	week_blank += 1
end
print "\n"

