#Celebrity doesn't know anyone
#Every one knows celebrity Given method a knows b, find celebrity

#Approach : elimination
#If A knows B, then A is not a celebrity
#If A doesn't know B, then B is not a celebrity

def find_celebrity(persons)
  possible_candidate = persons[0]
  for i in 1..persons.size-1
    result = knows?(persons[i], possible_candidate) #persons[i] knows poss candidate?
    possible_candidate = persons[i] unless result
  end
  #make sure possible candidate is a celebrity
  for i in 0..persons.size-1
    return nil if persons[i] != possible_candidate && (knows?(possible_candidate, persons[i]) || !knows?(persons[i], possible_candidate))
  end
  possible_candidate
end
