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
end
