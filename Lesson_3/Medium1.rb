#10.times { |number| puts (" " * number) + "The Flintstones Rock!"}

=begin def factors(number)
  divisor = number
  factors = []
  while divisor > 0 
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(0)
=end


=begin def fib(first_num, second_num)
  limit = 15
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
=end
