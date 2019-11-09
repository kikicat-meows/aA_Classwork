require 'benchmark'
require 'byebug'
require 'set'


### O(n^2) --- nested loops
def bad_two_sum?(arr, target_sum)
  (0...arr.length).each do |idx|
    (0...arr.length).each do |jdx|
      return true if arr[idx] + arr[jdx] == target_sum && jdx > idx
    end
  end
  false 
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


# def okay_two_sum?(arr, target_sum)
#   return false if arr.empty?

#   check = arr.shift
#   # debugger
#   arr.each { |num| return true if num + check == target_sum }

#   okay_two_sum?(arr,target_sum)

# end

### 2n log(n)
def b_search(arr, target)
return nil if arr.empty?

mid_idx = arr.length / 2
left = arr[0...mid_idx]
right = arr[mid_idx+1..-1]

if arr[mid_idx] == target
  return mid_idx
elsif arr[mid_idx] > target
  b_search(left, target)
else
  mid_idx + 1 + b_search(right, target) if !b_search(right, target).nil?
end
end

def okay_two_sum?(arr, target_sum)
  arr.sort!
  return false if arr.empty?

  res = target_sum - arr.shift

  return true if !b_search(arr, res).nil?
  
  okay_two_sum?(arr,target_sum)
end

# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

#2n
def two_sum?(arr, target_sum)
  counter = Hash.new(0)
  arr.each_with_index do |num, idx|
    counter[num] = idx
  end
  
  arr.each_with_index do |el, idx|
    res = target_sum - el
    return true if counter.include?(res) && idx != counter[res]
  end
 false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false















puts '---------------------------------------------'

puts "    user      system      total        real"
puts '---------------------------------------------'
puts 'bad_two_sum?'
puts 'true'
puts Benchmark.measure {bad_two_sum?(arr, 6)}
puts 'false'
puts Benchmark.measure {bad_two_sum?(arr, 10)}
puts '---------------------------------------------'
puts 'okay_two_sum?'
puts 'true'
puts Benchmark.measure {okay_two_sum?(arr, 6)}
puts 'false'
puts Benchmark.measure {okay_two_sum?(arr, 10)}
puts '---------------------------------------------'
puts 'two_sum?'
puts 'true'
puts Benchmark.measure {two_sum?(arr, 6)}
puts 'false'
puts Benchmark.measure {two_sum?(arr, 10)}
puts '---------------------------------------------'