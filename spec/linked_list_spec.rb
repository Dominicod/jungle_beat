# frozen_string_literal: true

require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  let(:list) { LinkedList.new }

  describe 'instantiation' do
    it 'is a instance of Node' do
      expect(list).to be_an_instance_of described_class
    end

    it 'has correct instance variables' do
      expect(list.head).to eq nil
    end
  end

  describe '.append' do
    it 'adds a new piece of data to the list' do
      list.append('doop')

      expect(list.head).to be_an_instance_of(Node)
      expect(list.head.next_node).to eq nil
      expect(list.head.data).to eq 'doop'
    end
  end

  describe '.count' do
    it 'returns the count of things in the list' do
      list.append('doop')

      expect(list.count).to eq 1
    end
  end

  describe '.to_string' do
    it 'generates a string of all the elements in the list, separated by spaces' do
      list.append('doop')

      expect(list.to_string).to eq 'doop'
    end
  end
end
