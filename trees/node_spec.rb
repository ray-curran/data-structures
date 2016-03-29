require_relative 'node'

describe Node do
  let(:node) {Node.new('hai')}

  describe '#new' do
    it 'initializes with a value' do
      expect(node.value).to eq 'hai'
    end

    it 'creates a new array list as the child element' do
      expect(node.children).to be_a ArrayList
    end

    it 'initializes with a length of 0' do
      expect(node.children.length).to eq 0
    end
  end

  describe '#add_child' do
    it 'changes the size of the children arraylist when adding items' do
      node.add_child('hai')
      expect{node.add_child('bai')}.to change{node.children.length}.from(1).to(2)
    end
  end
end