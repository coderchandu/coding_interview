#Select a random line in a file

class MyFile

attr_accessor :file_name

#Approach 1: For small files, read content, file length and find random line
def random_line_1
  contents = File.read(@file_name).split("\n")
  contents[rand(0..contents.size-1)]
end

#Approach 2: Somewhat efficient in space and run time - parse file to find number of lines.
#Get random number based on length and seek to it
def random_line_1
  num_lines = 0
  offset_size = [0] #Offset till that point in each element of the array
 
  File.foreach(@file_name) do |line|
    num_lines += 1
    offset_size[num_lines] = offset_size[num_lines-1] + line.size
  end
  rand_line = rand(1..num_lines)
  file_ptr = File.open(@file_name)
  file_ptr.seek(offset_size[rand_line-1])
  file_ptr.readline 
end

#https://gregable.com/2007/10/reservoir-sampling.html
def random_line_efficient

end

def initialize(arr_sentences, file_name)
  @file_name = file_name
  file = File.open(file_name, "w")
  arr_sentences.each do |sentence|
    file << sentence << "\n"
  end
  file.close
end

def print_file
  File.foreach(file_name) do |line|
    puts line
  end
end

end

file = MyFile.new(["This is a file", "For eg:", "This is testing a file", "Thats all for today"], "/tmp/test.txt")
file.print_file
puts "Printing random lines"
for i in 1..15
  puts file.random_line_1
end
