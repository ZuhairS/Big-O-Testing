def first_anagram?(first_string, second_string)
  p "First"
  start_time = Time.now
  all_anagrams = first_string.chars.permutation.map(&:join)
  result = all_anagrams.include?(second_string)
  p Time.now - start_time
  result
end

def second_anagram?(first_string, second_string)
  p "Second"
  start_time = Time.now
  first_arr = first_string.chars
  second_arr = second_string.chars
  first_arr.each do |char1|
    second_arr.each do |char2|
      if char1 == char2
        first_arr -= [char1]
        second_arr -= [char2]
      end
    end
  end
  result = first_arr.empty? && second_arr.empty?
  p Time.now - start_time
  result
end

def third_anagram?(first_string, second_string)
  p "Thirds"
  start_time = Time.now
  result = first_string.chars.sort == second_string.chars.sort
  p Time.now - start_time
  result
end

def fourth_anagram?(first_string, second_string)
  p "Fourth"
  start_time = Time.now
  counter_hash = Hash.new(0)
  first_string.chars.each { |ch| counter_hash[ch] += 1 }
  second_string.chars.each { |ch| counter_hash[ch] -= 1 }
  result = counter_hash.values.all?(&:zero?)
  p Time.now - start_time
  result
end


p first_anagram?("resistance", "ancestries")
p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives")

p second_anagram?("resistance", "ancestries")
p second_anagram?("gizmo", "sally")
p second_anagram?("elvis", "lives")

p third_anagram?("resistance", "ancestries")
p third_anagram?("gizmo", "sally")
p third_anagram?("elvis", "lives")

p fourth_anagram?("resistance", "ancestries")
p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")
