class MyQueue

  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    @store << el
  end

  def peek
    @store.last
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MinMaxStack

  def initialize
    @store = MyStack.new
  end

  def push(value)
    @store.push(
      max: new_max(value),
      min: new_min(value),
      val: value
    )
  end

  def new_max(value)
    empty? ? value : [max, value].max
  end

  def new_min(value)
    empty? ? value : [min, value].min
  end

  def empty?
    @store.empty?
  end

  def pop
    @store.pop[:val] unless empty?
  end

  def peek
    @store.peek[:val] unless empty?
  end

  def size
    @store.size
  end

  def max
    @store.peek[:max] unless empty?
  end

  def min
    @store.peek[:min] unless empty?
  end

end

class StackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    if @stack2.empty?
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

end

class MinMaxStackQueue

  def initialize
    @stack1 = MinMaxStack.new
    @stack2 = MinMaxStack.new
  end

  def enqueue(val)
    @stack1.push(val)
  end

  def dequeue
    if @stack2.empty?
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

  def max
    max = []
    max << @stack1.max unless @stack1.empty?
    max << @stack2.max unless @stack2.empty
    max.max
  end

  def min
    min = []
    min << @stack1.min unless @stack1.empty?
    min << @stack2.min unless @stack2.empty
    min.min
  end

end
