class Trie
  attr_accessor :root

  def initialize()
    @root = Node.new
  end

  class Node
    attr_accessor :children, :is_leaf

    def initialize()
      @children = {} #Children points to trie node, with each alphabet points to a child branch. Could be an array of pointers (one children for each alpha)
      @is_leaf = false
    end
  end

  def insert(str)
    ptr = @root
    for i in 0..str.size-1
      if !ptr.children.key?(str[i])
        ptr.children[str[i]] = Node.new
      end
      ptr = ptr.children[str[i]]
    end
    ptr.is_leaf = true
  end

  #Return all strings starting with prefix
  def get_matching_strings(prefix)
    puts "Matching for #{prefix}"
    ptr = @root
    for i in 0..prefix.size-1
      ptr = ptr.children[prefix[i]]
      return nil unless ptr
    end
    arr = []
    arr << prefix if ptr.is_leaf
    arr << get_strings(ptr, prefix)
    arr
  end

  def delete_string(str, parent=nil)
    node, parent = find(str)
    return if node.nil? || !node.is_leaf

    if node.children.empty?
      if parent
        parent.children.delete(str[str.size-1])
        delete_string(str[0..str.size-2, parent)
      end
    else
      node.is_leaf = false
    end
  end

  def find(str)
    ptr = @root
    parent = nil
    for i in 0..str.size-1
      parent = ptr
      ptr = ptr.children[str[i]]
      return nil unless ptr
    end
    return ptr, parent
  end

  def present?(str)
   ptr = find(str)[0]
   ptr && ptr.is_leaf ? true : false
  end

  def get_strings(ptr=@root, string_so_far="",results=[])
    return unless ptr
    ptr.children.each do |char, node|
      str = string_so_far.dup
      str << char 
      results << str if node.is_leaf
      get_strings(node, str, results)
    end
    results
  end

  def print(ptr=@root, string_so_far="")
    return unless ptr
    ptr.children.each do |char, node|
      str = string_so_far.dup
      str << char 
      puts str if node.is_leaf
      print(node, str)
    end
  end
end

trie = Trie.new
trie.insert("string")
trie.insert("st")
trie.insert("soap")
trie.print

puts "Checking presence"
puts trie.present?("st")
puts trie.present?("string")
puts trie.present?("soap")
puts trie.present?("str")
puts trie.present?("sti")
puts trie.present?("soa")
puts trie.present?("soaps")

puts trie.get_matching_strings("s")
puts trie.get_matching_strings("st")
puts trie.get_matching_strings("soa")
trie.insert("soa")
trie.insert("soya")
trie.insert("sonu")
trie.insert("saw")
puts trie.get_matching_strings("so")

puts "Tree now"
trie.print
trie.delete_string("soap")
puts "trie after soap"
trie.print
trie.delete_string("soap")
