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
    pointer = @head
    index.times do
      if pointer.nil?
        raise IndexError
      end
      pointer = pointer.next_node
    end
    pointer&.value
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

  def append!(value)
    new_node = Node.new(value)
    if self.empty?
        @head = new_node
    else
        last_node.next_node = new_node
    end
    self
  end

  def insert!(value, index)
    if self.empty?
        if index == 0
            append!(value)
        else
            raise IndexError
        end
    else
        pointer = @head
        previous = nil
        index.times do
            if pointer.nil?
                raise IndexError
            else
                previous = pointer
                pointer = pointer.next_node
            end
        end
        new_node = Node.new(value, pointer)
        previous.next_node = new_node
    end
    self
  end

  def to_s
    result = "LinkedList("
    pointer = @head
    while !pointer.nil? do
        result += pointer.value.to_s
        if !pointer.next_node.nil?
            result += ","
        end
        pointer = pointer.next_node
    end
    result+")"
  end

  private

    def last_node
        pointer = @head
        while !pointer.nil? && !pointer.next_node.nil? do
            pointer = pointer.next_node
        end
        pointer
    end
end
