=begin

Problem Statement
May 9, 2015
Given a 3 or 4 digit number with distinct digits, return a sorted array of all the unique numbers that can be formed with those digits.
Example:
Given: 123
Return: [123, 132, 213, 231, 312, 321]

=end

#my solution. Such a lame hack!

def number_shuffle(number)
  result = []
  1000.times do
    result << number.to_s.split("").shuffle.join.to_i
  end
  result.uniq.sort
end

#site solution
def number_shuffle(number)
  no_of_combinations = number.to_s.size == 3 ? 6 : 24
  digits = number.to_s.split(//)
  combinations = []
  combinations << digits.shuffle.join.to_i while combinations.uniq.size!=no_of_combinations
  combinations.uniq.sort
end
