#Implement an algorithm to print all valid (e.g., properly opened and closed) combinations of n-pairs of parentheses.
#For input 3, output: ()()(), ()(()), (())(), ((()))

#Left: As long as we haven’t used up all the left parentheses, we can always insert a left paren.
#Right: We can insert a right paren as long as it won’t lead to a syntax error. When will we get a syntax error? We will get a syntax error if there are more right parentheses than left.
#So, we simply keep track of the number of left and right parentheses allowed, and recurse

def printAllParans(count)
  str = ""
  printParans(count, count, str)
end

def printParans(left, right, str)
  if (left == 0 && right == 0)
    puts str
  end
  return if (left < 0 || right < left)
  if (left > 0)
    str1 = str.dup
    str1 << "("
    printParans(left-1, right, str1)
  end
  if (right > left)
    str2 = str.dup
    str2 << ")"
    printParans(left, right-1, str2)
  end
end

printAllParans(3)
