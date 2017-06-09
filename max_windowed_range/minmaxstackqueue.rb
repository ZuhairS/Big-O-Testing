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
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
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
