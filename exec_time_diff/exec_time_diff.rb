LIST = [ 0, 3, 5, 4, -5, 10, 1, 90 ].freeze
# phase 1 O(n^2)
def my_min_1(list)
  list.each do |num1|
    smallest_number = true
    list.each do |num2|
      smallest_number = false if num2 < num1
    end
    return num1 if smallest_number
  end
end

# phase 2 O(n)
def my_min_2(list)
  smallest_number = list.first
  list.each do |num|
    if num < smallest_number
      smallest_number = num
    end
  end
  smallest_number
end

list_a = [5, 3, -7]
list_b = [2, 3, -6, 7, -6, 7]
list_c = [-5, -1, -3]

# phase 1 > O(?)
def largest_contiguous_subsum_1(list)
  subarray_list = []
  list.each_index do |idx1|
    (idx1...list.length).each do |idx2|
      subarray_list << list[idx1..idx2]
    end
  end
  # subarray_list.length
  subarray_list.map { |sub_arr| sub_arr.reduce(:+) }.max
end

def largest_contiguous_subsum_2(list)
  current_sum = 0
  max_sum = 0
  return list.max if list.all? {|num| num < 0}
  list.each do |num|
    current_sum += num
    if current_sum < 0
      current_sum = 0
    elsif current_sum > max_sum
      max_sum = current_sum
    end
  end
  max_sum
end

p largest_contiguous_subsum_2(list_a)
p largest_contiguous_subsum_2(list_b)
p largest_contiguous_subsum_2(list_c)

# phase 2
