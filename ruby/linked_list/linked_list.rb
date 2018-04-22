class LinkedList
  attr_reader :head

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
    result = head
    index.times do
      if result.nil?
        raise IndexError
      end
      result = result.next_node
    end
    result
  end
end
