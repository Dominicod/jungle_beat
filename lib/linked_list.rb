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
    tail = false
    current_node = @head

    until tail
      if current_node.next_node
        current_node = current_node.next_node
      else
        current_node.next_node = Node.new(data)
        tail = true
      end
    end
  end
end
