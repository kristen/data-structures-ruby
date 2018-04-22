require "test/unit"
require_relative "linked_list"

class LinkedListSpec < Test::Unit::TestCase
  def test_empty
    linked_list = LinkedList.new
    assert(linked_list.empty?)
  end

  def test_nonempty
    node = Node.new(1)
    linked_list = LinkedList.new(node)
    assert(linked_list.nonempty?)
  end
end