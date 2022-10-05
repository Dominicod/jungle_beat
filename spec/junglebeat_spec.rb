# frozen_string_literal: true

require './lib/junglebeat'
require './lib/linked_list'
require './lib/node'

RSpec.describe JungleBeat do
  let(:jb) { JungleBeat.new }

  describe 'instantiation' do
    it 'is a instance of JungleBeat' do
      expect(jb).to be_an_instance_of described_class
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(jb.list).to be_an_instance_of LinkedList
      expect(jb.list.head).to eq nil
    end
  end

  describe '.append' do
    it 'appends new nodes to the list' do
      jb.append('fizz buzz bazz')
      expect(jb.list.head.data).to eq 'fizz'
      expect(jb.count).to eq 3
      expect(jb.list.head.next_node.data).to eq 'buzz'

      jb.append('bloop boop floop')
      expect(jb.count).to eq 6
    end
  end

  describe '.count' do
    it 'returns the count of elements in the list' do
      jb.append('fizz buzz bazz')
      expect(jb.count).to eq 3

      jb.append('fizz')
      expect(jb.count).to eq 4
    end
  end
end
