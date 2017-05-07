#You are given n days and for each day (di) you could either perform a high effort tasks (hi) or a low effort tasks (li) or
# no task with the constraint that you can choose a high-effort tasks only if you chose no task on the previous day. Write a 
#program to find the maximum amount of tasks you can perform within these n days

def max_tasks(high_cost, low_cost, n)
  max_task_values = Array.new(n)
  max_task_values[0] = high_cost[0]
  for i in 1..n-1
    high_value = high_cost[i]
    high_value += max_task_values[i-2] if i-2>=0
    max_task_values[i] = [low_cost[i] + max_task_values[i-1], high_value].max
  end
  max_task_values[n-1]
end

puts max_tasks([3, 6, 8, 7, 6], [1, 5, 4, 5, 3], 5)
