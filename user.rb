require 'date'

class User
 attr_reader :name, :date_of_birth

 def initialize(name, date_of_birth)
   @name = name
   @date_of_birth = date_of_birth
 end

 # Returns an Integer representing the user’s current age
 def age
  (Date.today - @date_of_birth).to_i / 365
 end

 # Returns a Date object for the user's next birthday
 def next_birthday
  year_difference = (Date.today.year - @date_of_birth.year)
  current_month = Date.today.month
  current_day = Date.today.day

  if @date_of_birth.month > current_month || @date_of_birth.month == current_month && @date_of_birth.day > current_day
    Date.new((@date_of_birth.year + year_difference), @date_of_birth.month, @date_of_birth.day)
  else
    next_birthday_year = @date_of_birth.year + (year_difference + 1)
    Date.new(next_birthday_year, @date_of_birth.month, @date_of_birth.day)
  end
 end
end


tests = [
 Date.new(1986, 1, 1),
 Date.new(1988, Date.today.month, Date.today.day),
 Date.new(1990, 12, 30),
]
puts "====== ages ======"

tests.each do |date|
 puts "#{date} => #{User.new("Test", date).age}"
end

puts "====== birthdays ======"

tests.each do |date|
 puts "#{date} => #{User.new("Test", date).next_birthday}"
end
