def gcd(x,y)
  return y == 0? x : gcd(y, x%y)
end
