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

  def prepend_node(data)
    @head ? prepend_head(data) : @head = Node.new(data)
  end

  def insert(index, data)
    return prepend_node(data) if index.zero?

    return append(data) if index > count

    insert_node(index, data)
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
    while node
      string_arr << node.data
      node = node.next_node
    end
    string_arr.join(' ')
  end

  #################################### -> Private Methods

  private

  def insert_node(index, data)
    previous_node = find_node(index - 1).shift
    current_node = find_node(index).shift
    new_node = Node.new(data)

    new_node.next_node = current_node
    previous_node.next_node = new_node
    set_index
  end

  def find_node(index1, index2 = index1)
    node = @head
    return_arr = []
    while node
      return_arr << node if node.index_position >= index1 && node.index_position <= index2
      node = node.next_node
    end
    return_arr
  end

  def prepend_head(data)
    node = Node.new(data)
    node.next_node = @head
    @head = node
    set_index
  end

  def append_next_node(data)
    current_node = find_tail
    current_node.next_node = Node.new(data)
    set_index
  end

  def set_index
    node = @head
    index_p = 0
    while node
      node.index_position = index_p
      index_p += 1
      node = node.next_node
    end
  end

  def find_tail
    node = @head

    return node unless node.next_node

    return node unless node.next_node while (node = node.next_node)
  end
end
