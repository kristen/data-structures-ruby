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

  def test_get_out_of_range
    linked_list = LinkedList.new
    assert_raise( IndexError ) { linked_list.get(1) }
  end

  def test_get_first
    linked_list = LinkedList.from_array([1])
    assert_equal(linked_list.get(0).value, 1)
  end

  def test_get_last
    array = [1,2,3]
    linked_list = LinkedList.from_array(array)
    assert_equal(linked_list.get(array.length - 1).value, array.last)
  end

  def test_first
    assert_nil(LinkedList.new.first)
    linked_list = LinkedList.from_array([1])
    assert_equal(linked_list.first.value, 1)
  end

  def test_last
    assert_nil(LinkedList.new.last)
    assert_equal(LinkedList.from_array([1,2,3]).last.value, 3)
  end

  def test_length
    assert_equal(LinkedList.new.length, 0)
    assert_equal(LinkedList.from_array([1]).length, 1)
    assert_equal(LinkedList.from_array([1,2]).length, 2)
    assert_equal(LinkedList.from_array([1,2,3]).length, 3)
  end

  def test_append_empty
    linked_list = LinkedList.new.append(1)
  end
end