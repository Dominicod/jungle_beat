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
    node = @head
    counter = 1
    counter += 1 while (node = node.next_node)
    counter
  end

  def to_string
    node = @head
    string_arr = []
    string_arr << node.data while (node = node.next_node)
    string_arr.join(' ')
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
