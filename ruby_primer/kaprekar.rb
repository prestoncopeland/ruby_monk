=begin
Problem Statement
Completed: 5/8/15
9 is a Kaprekar number since
9 ^ 2 = 81 and 8 + 1 = 9

297 is also Kaprekar number since
297 ^ 2 = 88209 and 88 + 209 = 297.

In short, for a Kaprekar number k with n-digits, if you square it and add the right n digits to the left n or n-1 digits, the resultant sum is k.

Find if a given number is a Kaprekar number.

=end

def kaprekar?(k)
  #get k digits
  n = k.to_s.split("").size
  #square k
  num_sq = k**2
  #to get right n digits, turn sq of k into
  #an array, reverse it, and take first n entries
  #reverse it back, then convert it back into an
  #integer (whew!)
  num_sq_ary = num_sq.to_s.split("")
  num_sq_ary_reverse = num_sq_ary.reverse
  right_side = num_sq_ary_reverse.slice(0,n).reverse.join.to_i
  left_side = num_sq_ary.slice(0,num_sq_ary.size-n).join.to_i
  right_side + left_side == k
end

#above cleaned up

def kaprekar?(k)
  n = k.to_s.split("").size
  k_sq = k**2
  k_sq_ary = k_sq.to_s.split("")
  right_side = k_sq_ary.reverse.slice(0,n).reverse.join.to_i
  left_side = k_sq_ary.slice(0,k_sq_ary.size-n).join.to_i
  right_side + left_side == k
end

#solution from site
def kaprekar?(k)
  no_of_digits = k.to_s.size
  square = (k ** 2).to_s

  second_half = square[-no_of_digits..-1]
  first_half = square.size.even? ? square[0..no_of_digits-1] : square[0..no_of_digits-2]

  k == first_half.to_i + second_half.to_i
end