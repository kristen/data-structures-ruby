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

  def test_from_array_empty
    linked_list = LinkedList.from_array([])
    assert(linked_list.empty?)
  end

  def test_from_array
    array = [1]
    linked_list = LinkedList.from_array(array)
    assert_equal(linked_list.head.value, array.first)
  end

  def test_from_array_keeps_same_order
    array = [1,2,3]
    linked_list = LinkedList.from_array(array)
    assert_equal(linked_list.head.value, array.first)
    assert_equal(linked_list.head.next_node.value, array[1])
    assert_equal(linked_list.head.next_node.next_node.value, array[2])
  end

end