class DoubleLinkedList
  attr_accessor :head, :tail

  def initialize(arr=[])
    insert_data(arr)
  end

  class Node
    attr_accessor :key, :data, :next, :prev

    def initialize(data, key)
      @data = data
      @key = key
    end
  end

  def insert_to_head(data, key)
    node = Node.new(data, key)
    if @head
      @head.prev = node
      node.next = @head
      @head = node
    else
      @head = @tail = node
    end
    node
  end

  def delete_tail_node
    return unless @tail
    node = @tail
    @tail.prev.next = nil if @tail.prev
    @tail = @tail.prev
    node
  end

  def insert_data(arr)
    return if arr.size == 0

    node = Node.new(arr[0])
    @head = @tail = node unless @head
    prev = @head
    for i in 1..arr.size-1
      node = Node.new(arr[i])
      node.prev = prev
      prev.next = node
      prev = node
    end
  end

  def move_to_head(node)
    return if node.nil? || node == @head
    node.prev.next = node.next
    node.next.prev = node.prev if node.next
    node.prev = nil
    node.next = @head
    @head.prev = node if @head
    @head = node
  end

  def print_list
    return unless @head

    ptr = @head
    while (ptr)
      print ptr.data, " "
      ptr = ptr.next
    end
    puts
  end
end

#Design LRU cache
#When cache is full, remove the least recently used item (oldest access time)
#Approach hash with value pointing to the list
class MyCache
  attr_accessor :size, :hash, :list

  def initialize(capacity)
    @size = capacity
    @hash = {}
    @list = DoubleLinkedList.new
  end

  def get(key)
    value = @hash[key]
    return nil unless value
    list.move_to_head(value)
    value.data
  end

  def has_key?(key)
    @hash.key?(key) 
  end

  def set(key, value)
    if has_key?(key)
      list.move_to_head(@hash[key])
      return
    end
    if @hash.keys.size == @size
      #Cache full. Remove LR entry
      node = list.delete_tail_node
      @hash.delete(node.key) if node
    end
    node = list.insert_to_head(value, key) 
    @hash[key] = node
  end

  def delete(key)
    value = @hash[key]
    return nil unless value

    @hash.delete(key)
    list.delete_node(value)
    value
  end
end
cache = MyCache.new(3)

cache.set(1, "A")
cache.set(2, "B")

puts cache.has_key?(1)
puts cache.has_key?(2)
puts cache.has_key?(3)
cache.set(3, "C")

puts cache.list.print_list
cache.set(4, "D")
puts "Max size"
puts cache.has_key?(1)
puts cache.get(1)
puts cache.get(2)
puts cache.get(3)
puts cache.get(4)
