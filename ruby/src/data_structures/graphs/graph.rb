require "../stack/stack.rb"
require "../queue.rb"

class Graph
  attr_accessor :root

  class Node
    attr_accessor :data, :neighbors

    def initialize(data)
      @data = data
      @neighbors = []
    end
  end

  def dfs
    return unless @root

    visited = {}
    stack = Stack.new
    stack.push(@root)
    while (stack.top)
      node = stack.pop
      next if visited.key?(node)
      node.neighbors.each do |neighbor|
        stack.push(neighbor) unless visited.key?(neighbor)
      end
      puts node.data
      visited[node] = true
    end    
  end

  def bfs
    return unless @root

    visited = {}
    queue = Queue.new
    queue.enqueue(@root)
    while (!queue.empty?)
      node = queue.dequeue
      next if visited.key?(node)
      node.neighbors.each do |neighbor|
        queue.enqueue(neighbor) unless visited.key?(neighbor)
      end
      puts node.data
      visited[node] = true
    end
  end

  def route_search(startNode, endNode)
    return unless startNode
    visited = {}
    queue = Queue.new 
    queue.enqueue(startNode)
    while (!queue.empty?)
      node = queue.dequeue
      return true if node == endNode
      next if visited.key?(node)
      node.neighbors.each do |neighbor|
        return true if neighbor == endNode
        queue.enqueue(neighbor) unless visited.key?(neighbor)
      end
      visited[node] = true
    end
    false
  end
end

g = Graph.new
g.root = Graph::Node.new(1)
g.root.neighbors= [Graph::Node.new(3), Graph::Node.new(5),Graph::Node.new(7),Graph::Node.new(9)]
node = g.root.neighbors.first
node.neighbors = [Graph::Node.new(2),Graph::Node.new(4)]
node = g.root.neighbors[2]
node.neighbors = [Graph::Node.new(6),Graph::Node.new(8)]

puts "BFS----"
g.bfs
puts "DFS---"
g.dfs
puts "Search 1,3 => Expect true. ", g.route_search(g.root, g.root.neighbors.first)
puts "Search 1,2 => Expect true. ", g.route_search(g.root, g.root.neighbors.first.neighbors.first)
puts "Search 1,8 => Expect true. ", g.route_search(g.root, g.root.neighbors[2].neighbors.last)
puts "Search 3,8 => Expect false. ", g.route_search(g.root.neighbors.first, g.root.neighbors[2].neighbors.last)
