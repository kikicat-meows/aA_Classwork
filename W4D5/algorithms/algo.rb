require 'benchmark'

def my_min_1(arr)
  arr.each_with_index do |el_1,i_1|
    smallest = el_1
    arr.each_with_index do |el_2,i_2|
      if i_1 < i_2
        smallest = el_2 if el_2 < el_1
      end
    end

    return smallest
  end
end

###

# arr.each_with_index do |el, idx|

#   return el if arr.drop(idx).all? {|el_2| el < el_2 }

# end

def my_min_2(arr)
  arr.inject { |smallest,el| smallest < el ? smallest : el}
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
puts Benchmark.measure {my_min_1(list)}
puts Benchmark.measure {my_min_2(list)}

### my_min_2 wins






def lcs_1(arr)
  sub_arr = []

  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      sub_arr << arr[i..j] if arr[i..j].length >= 1
    end
  end

  sub_arr.map(&:sum).max
end



def lcs_2(arr)
  largest = arr.first

  max_el = arr.first
  current_sum = 0

  arr.each do |el|
    max_el = el if el > max_el

    if current_sum + el > 0
      current_sum += el
    else
      current_sum = 0
    end

    if largest < max_el || largest < current_sum
      largest = max_el > current_sum ? max_el : current_sum
    end
  end
  
  largest
end

list_2 = [2, 3, -6, 7, -6, 7,-9]

p lcs_2(list_2)
puts Benchmark.measure {lcs_1(list_2)}
puts Benchmark.measure {lcs_2(list_2)}