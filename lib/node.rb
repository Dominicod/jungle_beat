# frozen_string_literal: true

# Node for linked list
class Node
  attr_reader :data
  attr_accessor :next_node,
                :index_position

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
    @index_position = nil
  end
end
