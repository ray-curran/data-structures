require_relative 'node'

describe Node do

  let(:node) {Node.new('hai')}

  describe '#initialize' do
    it 'stores an element that can be accessed afterwards' do
      expect(node.element).to eq 'hai'
    end

    it 'starts with no next node when initialized' do
      expect(node.next_node). to eq nil
    end
  end

  describe '#insert_after' do
    it 'adds the second node as a reference in the first node' do
      second_node = Node.new('bai')
      node.insert_after(second_node)
      expect(node.next_node).to eq second_node
    end
  end

  describe '#remove_after' do
    it 'removes the second node when called on' do
      second_node = Node.new('bai')
      node.insert_after(second_node)
      node.remove_after
      expect(node.next_node).to eq nil
    end
  end

end
