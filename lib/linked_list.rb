# frozen_string_literal: true

# creates the LinkedList of nodes
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    @head ? append_next_node(data) : @head = Node.new(data)
  end

  def count
    1
  end

  def to_string
    @head.data
  end

  private

  def append_next_node(data)
    current_node = find_tail
    current_node.next_node = Node.new(data)
  end

  def find_tail
    node = @head
    return node unless node.next_node

    return node unless node.next_node while (node = node.next_node)
  end
end
