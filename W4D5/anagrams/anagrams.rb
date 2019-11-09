require 'benchmark'

### O(n!) - permutation
def first_anagram?(str1, str2)
  str1.split('')
      .permutation
      .to_a
      .include?(str2.split(''))
end

# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

### O(2n^2) -- delete also a loop
def second_anagram?(str1, str2)
  word2 = str2.split("")

  str1.each_char do |char|
    idx = word2.find_index(char)

    word2.delete_at(idx) if !idx.nil?
  end

  word2.empty?   
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

### O(nlog(n)) - log-linear because of sort
def third_anagram?(str1, str2)
  word1 = str1.split("")
  word2 = str2.split("")

  word1.sort == word2.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

### O(4n) ### 4 iterations
def fourth_anagram?(str1, str2)
  count_1 = Hash.new(0)
  count_2 = Hash.new(0)

  (0...str1.length).each do |idx|
    count_1[str1[idx]] += 1
  end
  
  (0...str2.length).each do |idx|
    count_2[str2[idx]] += 1
  end

  count_1 == count_2
end

# p fourth_anagram?("gizmo", "sally")    #=> false
# p fourth_anagram?("elvis", "lives")    #=> true

### O(3n) ### 3 loops only? --- saves space as well
def bonus_anagram?(str1, str2)
  count = Hash.new(0)
 

  (0...str1.length).each do |idx|
    count[str1[idx]] += 1
  end
  
  (0...str2.length).each do |idx|
    count[str2[idx]] -= 1
  end

  count.all? { |k,v| v == 0 }
end

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true



puts '---------------------------------------------'

puts "    user      system      total        real"
puts Benchmark.measure {first_anagram?("elvis", "lives")}
puts Benchmark.measure {second_anagram?("elvis", "lives")}
puts Benchmark.measure {third_anagram?("elvis", "lives")}
puts Benchmark.measure {fourth_anagram?("elvis", "lives")}
puts Benchmark.measure {bonus_anagram?("elvis", "lives")}

