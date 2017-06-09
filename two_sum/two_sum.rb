require 'byebug'
array = [0,1,5,7]


# Brute force time complexity:
def bad_two_sum?(arr, target)
  (0...(arr.length - 1)).each do |idx1|
    ((idx1 + 1)...arr.length).each do |idx2|
      return true if arr[idx1] + arr[idx2] == target
    end
  end
  false
end

# Sorting
def okay_two_sum?(arr, target)
  sorted = arr.sort
  sorted.each_with_index do |el, idx|
    # byebug
    test_array = sorted[0...idx] + sorted[(idx + 1)..-1]
    test_num = test_array.bsearch {|num| el + num == target}
    return true unless test_num.nil?
  end
  false
end

# Hash Map
def two_sum?(arr, target)
  counter_hash = Hash.new { |h, k| h[k] = [] }
  arr.each_with_index do |num1, idx1|
    return true unless counter_hash[target - num1].empty?
    counter_hash[num1] << idx1
  end

  false
end

# p bad_two_sum?(array, 6)
# p bad_two_sum?(array, 10)

# p okay_two_sum?(array, 6)
# p okay_two_sum?(array, 10)

# p two_sum?(array, 6)
# p two_sum?(array, 10)
