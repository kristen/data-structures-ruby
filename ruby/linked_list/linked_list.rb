class LinkedList
  def initialize(first_node = nil)
    @head = first_node
  end

  def self.from_array(array)
    h = nil
    array.reverse_each do |value|
      h = Node.new(value, h)
    end
    LinkedList.new(h)
  end

  def empty?
    @head.nil?
  end

  def nonempty?
    !empty?
  end

  def get(index)
    result = @head
    index.times do
      if result.nil?
        raise IndexError
      end
      result = result.next_node
    end
    result&.value
  end

  def first
    @head&.value
  end

  def last
    last_node&.value
  end

  def length
    count = 0
    pointer = @head
    while !pointer.nil? do
        pointer = pointer.next_node
        count += 1
    end
    count
  end

  def append(value)
    new_node = Node.new(value)
    last_node = last_node
    if last_node.nil?
        @head = new_node
    else
        last_node.next_node = new_node
    end
    self
  end

  private

    def last_node
        result = @head
        while !result.nil? && !result.next_node.nil? do
            result = result.next_node
        end
        result
    end
end
