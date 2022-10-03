# frozen_string_literal: true

require './lib/node'

RSpec.describe Node do
  let(:node) { Node.new('plop') }

  describe 'instantiation' do
    it 'is a instance of Node' do
      expect(node).to be_an_instance_of Node
    end

    it 'has correct instance variables' do
      expect(node.data).to eq 'plop'
      expect(node.next_node).to eq nil
    end
  end
end
