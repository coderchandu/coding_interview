def swap(a,b) 
  puts "swapping a=#{a},b=#{b}"
  a=a+b #4,6
  b=a-b
  a=a-b
  puts "a=#{a}"
  puts "b=#{b}"
end

swap(9,0)
swap(8,16)
swap(-9,9)
swap(10,-10) 
