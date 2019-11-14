class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    # if @next.nil? && @prev.nil? ## only 1 element in list



    if !@next.nil? && !@prev.nil?  ## in the middle
      @prev.next = @next
      @next.prev = @prev
    elsif @prev.nil? && !@next.nil?  ## first one
      @next.prev = nil
    elsif !@prev.nil? && @next.nil? ## last one
      @prev.next = nil
    end 
   
    @next, @prev = nil, nil
  end
end

class LinkedList
  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    first.key == nil
  end

  def get(key)
    node = first

    while node.key != key
      return nil if node.next.nil?
      node = node.next
    end

    node.val
  end

  def include?(key)
    node = first

    while node.key != key
      return false if node.next.nil?
      node = node.next
    end

    true
  end

  def append(key, val)
    node = Node.new(key, val)

    if empty?
      @head = node
      @tail = node
      @head.next = nil
      @head.prev = nil
      @tail.next = nil
      @tail.prev = nil
    else
      @tail.next = node
      node.prev = @tail
      @tail = node
      node.next = nil
    end

    node
  end

  def update(key, val)
    node = first
    unless node.key == key
      node = node.next
    end

    node.val = val
  end

  def remove(key)
    node = first

    ### code below determines special cases where @head & @tail needs to reset to either nil, or the next one in the chain
    
    ## only 1 element in array
    if first.key == key && first.next.nil?  
      @head = nil
      @tail = nil
    end

    while node.key != key
      return nil if node.next.nil?
      node = node.next
    end

    ### removing first with more than 1 element
    if first.key == key
      @head = first.next
    elsif last.key == key
      @tail = last.prev
    ### removing last with more than 1 element
    end

    node.remove
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
