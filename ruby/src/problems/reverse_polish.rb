require "../data_structures/stack/stack.rb"

#Postfix expression - calculate value

# (2+1)*3 => 2 1 + 3 *
# (4 + (13/5)) => 4 13 5 / +

#Approach: Use stack. Add elements to stack till operator. Pop elements and evaluate
#expression and put result back to stack

def evaluate(postfix)
  stack = Stack.new
  operators = "+-*/^"
  for i in 0..postfix.size-1
    if !operators.include?(postfix[i])
      stack.push(postfix[i].to_i)
    else
      case postfix[i]
        when '+'
          value = stack.pop() + stack.pop
        when '-'
          b = stack.pop()
          value = stack.pop() - b
        when '*'
          value = stack.pop() * stack.pop
        when '/'
          b = stack.pop()
          value = stack.pop() / b
        when '^'
          b = stack.pop()
          value = stack.pop ^ b
      end
      stack.push(value)
    end
  end
  stack.pop
end

puts evaluate(["2", "1", "+", "3", "*"])
puts evaluate(["4", "13", "5", "/", "+"])
