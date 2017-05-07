#The point of this exercise is to implement the bencoding format, by taking a bencoded string as input, and converting it to native Ruby types as output.

#Bencoding supports 4 different types.
#Integers are represented with delimiters 'i' and 'e'.
#Strings are prefixed with their string length as an integer, followed by a ':' character, and then the characters that make up that string.
#Lists are prefixed with an 'l' character, filled with a variable number of other bencoded types, then end with an 'e' character delimiter.
#Dictionaries are prefixed with a 'd' character, filed with a variable number of other bencoded types, then end with an 'e' character delimiter.

class EncodeType
  INTEGER=0
  STRING=1
  LIST=2
  DICTIONARY=3
end

class BenCode
  def self.decode(str)
    parse(str)[0]
  end

  def self.parse(str)
    if (str[0] == "i")
      val, new_str = decode_integer(str[1..str.size-1])
    elsif (str[0] == 'l')
      val, new_str = decode_list(str[1..str.size-1])
    elsif (str[0] == 'd')
      val, new_str = decode_dictionary(str[1..str.size-1])
    else
      val, new_str = decode_string(str)
      if (!val)
        raise "Unsupported #{str}"
      end
    end

    return val, new_str
  end

  def self.decode_integer(str)
    end_index = str.index('e')
    return str[0..end_index-1].to_i, str[end_index+1..str.size-1]
  end

  def self.decode_string(str)
    s_arr = str.split(":", 2)
    if (s_arr.size > 1 && s_arr[0].to_i <= s_arr[1].size)
      return s_arr[1][0..s_arr[0].to_i-1], s_arr[1][s_arr[0].to_i..s_arr[1].size-1]
    end
  end

  def self.decode_list(str)
    i = 1
    list_values = []
    while (str[0] != 'e')
      val, str = parse(str)
      list_values << val 
    end
    return list_values, str[1..str.size-1]
  end
end

print " 15 => ", BenCode.decode("i15e"), "\n" 
print " dog => ", BenCode.decode("3:dog"), "\n" 
print " robots54 => ", BenCode.decode("8:robots54"), "\n" 
print " [green, red, blue] => ", BenCode.decode("l5:green3:red4:bluee"), "\n" 
