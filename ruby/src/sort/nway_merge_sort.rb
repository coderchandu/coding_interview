#Given n sorted lists, sort the entire lists
#Array of lists
def sort(lists)
  #1 approach is to do merge 1st and 2nd. then the result and next and so on till we get final result. Use simple merge

  #2 Efficient approach
  #Create a min heap of size n(total number of list). Add 1st element from each list to the heap
  #Root always have minimum, so add root to the resultant list. Get next element from the list which the root belongs to and add
  #it to the root and heapify
end 
