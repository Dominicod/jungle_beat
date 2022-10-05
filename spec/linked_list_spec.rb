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

      list.append('deep')

      next_node_data = list.head.next_node.data
      next_node_nn = list.head.next_node.next_node

      expect(list.head.next_node).to be_an_instance_of(Node)
      expect(next_node_nn).to eq nil
      expect(next_node_data).to eq 'deep'
    end
  end

  describe '.count' do
    it 'returns the count of things in the list' do
      list.append('doop')
      expect(list.count).to eq 1

      list.append('deep')
      expect(list.count).to eq 2
    end
  end

  describe '.to_string' do
    it 'generates a string of all the elements in the list, separated by spaces' do
      list.append('doop')
      expect(list.to_string).to eq 'doop'

      list.append('deep')
      expect(list.to_string).to eq 'doop deep'
    end
  end

  describe '.prepend_node' do
    it 'prepends a node at the beginning of the linked list, replacing the head' do
      list.prepend_node('doop')
      expect(list.count).to eq 1
      expect(list.to_string).to eq 'doop'

      list.append('plop')
      expect(list.count).to eq 2
      expect(list.to_string).to eq 'doop plop'

      list.prepend_node('bazz')
      expect(list.count).to eq 3
      expect(list.to_string).to eq 'bazz doop plop'
    end
  end

  describe '.insert' do
    before :each do
      list.append('plop')
      list.append('bazz')
      list.append('fizz')
    end

    it 'inserts a node in the given index position' do
      list.insert(1, 'bloop')
      expect(list.count).to eq 4
      expect(list.to_string).to eq 'plop bloop bazz fizz'
    end
    it 'inserts a node as head if given index position 0' do
      list.insert(0, 'bloop')
      expect(list.count).to eq 4
      expect(list.to_string).to eq 'bloop plop bazz fizz'
    end
    it 'appends a node if given index is out of index range' do
      list.insert(4, 'bloop')
      expect(list.count).to eq 4
      expect(list.to_string).to eq 'plop bazz fizz bloop'
    end
  end

  describe '.find' do
    before :each do
      list.append('plop')
      list.append('bazz')
      list.append('fizz')
    end

    it 'returns the correct index positions' do
      expect(list.find(1, 2)).to eq 'bazz fizz'
      expect(list.find(0, 2)).to eq 'plop bazz fizz'
    end

    it 'returns index position 1 and nothing else if given a single argument' do
      expect(list.find(1)).to eq 'bazz'
    end
  end

  describe '.includes?' do
    before :each do
      list.append('plop')
      list.append('bazz')
      list.append('fizz')
    end

    it 'returns boolean based on inclusion of data in the list' do
      expect(list.includes?('plop')).to eq true
      expect(list.includes?('bazz')).to eq true
      expect(list.includes?('buzz')).to eq false
    end
  end
end
