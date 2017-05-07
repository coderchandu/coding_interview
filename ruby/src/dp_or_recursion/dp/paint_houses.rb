#Given a list of houses and the cost of painting each house, the houses can be painted in three colors RED, GREEN and BLUE,
# two neighboring houses can’t be painted in the same color, calculate the total minimum cost for painting all houses.

#cost is a 2d array with each row having 3 columns which represents cost of red, green and blue colors resp
def min_cost_to_paint(cost)
  min_cost_per_color = Array.new(cost.size) { Array.new(cost[0].size) } #min cost for each house till that house

  for j in 0..cost[0].size-1
    min_cost_per_color[0][j] = cost[0][j]
  end
  for i in 1..cost.size-1
    min_cost_per_color[i][0] = cost[i][0] + [min_cost_per_color[i-1][1], min_cost_per_color[i-1][2]].min
    min_cost_per_color[i][1] = cost[i][1] + [min_cost_per_color[i-1][0], min_cost_per_color[i-1][2]].min
    min_cost_per_color[i][2] = cost[i][2] + [min_cost_per_color[i-1][0], min_cost_per_color[i-1][1]].min
  end
  min_cost_per_color[i].min
end

puts min_cost_to_paint([
  [1,4,6],[6,100,12],[100,3,4],[8,1,7]
])
