def lcm(x,y)
  return 0 if x<=0 || y<=0
  return x if x==y
  min = [x,y].min
  max = [x,y].max
  for i in 2..min-1
    val = max*i
    return val if val%min == 0
  end
  max * min
end
