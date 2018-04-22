require_relative "node"

class NodeSpec < Test::Unit::TestCase
  def test_new_value
    node = Node.new(1)
    assert_equal node.value, 1
    assert_equal node.next_node, nil
  end

  def test_new_node_with_next_node
    next_node = Node.new(2)
    node = Node.new(1, next_node)
    assert_equal node.value, 1
    assert_equal node.next_node, next_node
  end
end