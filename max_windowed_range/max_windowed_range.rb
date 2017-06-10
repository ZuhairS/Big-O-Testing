require_relative 'minmaxstackqueue.rb'

def windowed_max_range(arr, window_size)
  current_max_range = nil
  arr.each_index do |idx|
    test_case = idx + window_size
    break if test_case > (arr.length)
    current_window = arr[idx...(idx + window_size)]
    range = current_window.max - current_window.min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end
  current_max_range
end

# p windowed_max_range([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
# p windowed_max_range([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
# p windowed_max_range([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
# p windowed_max_range([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8

def windowed_max_range_optimized(arr, window_size)
  queue = MinMaxStackQueue.new
  max_range = nil
  arr.each do |el|
    queue.enqueue(el)
    if queue.size == window_size
      current_max_range = queue.max - queue.min
      if max_range.nil? || current_max_range > max_range
        max_range = current_max_range
      end
      queue.dequeue
    end
  end
  max_range
end

p windowed_max_range_optimized([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p windowed_max_range_optimized([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p windowed_max_range_optimized([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p windowed_max_range_optimized([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
