class MaxIntSet

  attr_accessor :store

  def initialize(max)
    @store = Array.new(max, false)

  end

  def insert(num)
    raise "Out of bounds" if num > @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    remove(num) if include?(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    remove(num) if include?(num)
    self[num] << num
    @count += 1

    resize! if @count == num_buckets
  end

  def remove(num)
    return if !include?(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  def inspect
    @store
  end

  private
  attr_accessor :store;

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    double = num_buckets * 2
    new_set = Array.new(double) { Array.new }

    (0...num_buckets).each do |bucket|
      self[bucket].each do |num|
        new_set[num % new_set.length] << num 
      end
    end

    @store = new_set 
  end
end
