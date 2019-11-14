class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_key = self.first.hash
    (1...self.length).each do |idx|
      hash_key += (self[idx].hash * (idx + 1))
    end
    hash_key
  end
end

class String
  def hash
    alpha = ("a".."z").to_a + ("A".."Z").to_a
    hash_key = 0

    self.each_char.with_index do |char,idx|
      hash_key += ((alpha.index(char) + 1).hash * (idx + 1))
    end

    hash_key
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  # only works when key value pairs contains no more than 1 letter at a time
  def hash
    alpha = ("a".."z").to_a + ("A".."Z").to_a
    hash_key = 0

    self.each do |key, value|
      if key.is_a?(Integer)
        key_integer = key
      else
        key_integer = alpha.index(key.to_s) + 10
      end
      
      if value.is_a?(Integer)
        value_integer = value
      else
        value_integer = alpha.index(value.to_s) + 10
      end

      hash_key += (2 * key_integer) + value_integer
    end

    hash_key
  end
end
