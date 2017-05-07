#Deep clone - eg: h={"objs"=>[{a:[33,32], b:{p:[34,45]}}, {a:2, b:3} ]"}

def deep_clone(hash)
  hash1 = {}
  hash.each do |k,v|
    hash1[k] = deep_clone_value(v)
  end
  hash1
end

def deep_clone_value(v)
  if v.is_a?(Array)
    v.map { |val| deep_clone_value(val) }  
  elsif v.is_a?(Hash)
    h = {}
    v.each { |k, v| h[k] = deep_clone_value(v) }
    h
  else
    v
  end
end

h={"objs"=>[{a:[33,32], b:{p:[34,45]}}, {a:2, b:3} ]}
h1 = deep_clone(h)
puts h1
puts h==h1
