# frozen_string_literal: true

# linked list for Node
class Node
  attr_reader :data,
              :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end
