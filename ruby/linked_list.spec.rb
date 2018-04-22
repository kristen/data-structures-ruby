require "test/unit"
require_relative "linked_list"

class LinkedListSpec < Test::Unit::TestCase

  def setup
    @linked_list = LinkedList.new()
  end

  # def teardown
  # end

  def test_one
    assert_equal(@linked_list.one(), 1)
  end
end