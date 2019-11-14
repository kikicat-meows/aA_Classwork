class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    remove(key) if include?(key)
    self[key] << key
    @count += 1

    resize! if @count == num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return if !include?(key)
    self[key].delete(key)
    @count -= 1
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    double = num_buckets * 2
    new_set = Array.new(double) { Array.new }

    (0...num_buckets).each do |bucket|
      @store[bucket].each do |key|
        new_set[key.hash % new_set.length] << key
      end
    end

    @store = new_set 
  end
end

