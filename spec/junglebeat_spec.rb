# frozen_string_literal: true

require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  let(:jb) { JungleBeat.new }

  describe 'instantiation' do
    expect(jb).to be_an_instance_of described_class
  end
end
