require_relative 'tree'

describe Tree do

  let(:node) {Node.new('hai')}
  let(:tree) {Tree.new(node)}

   let(:body_node) {Node.new('body')}
   let(:html_tree) {Tree.new(body_node)}
   let(:div_node_one) {Node.new('div')}
   let(:div_node_two) {Node.new('div')}
   let(:div_node_three) {Node.new('div')}
   let(:p_node_1) {Node.new('p')}
   let(:p_node_2) {Node.new('p')}
   let(:b_node) {Node.new('b')}

  describe '#initialize' do
    it 'gives the first element at initialization as the root' do
     expect(tree.root).to eq node
   end


   before do
    body_node.add_child(div_node_one)
    body_node.add_child(div_node_two)
    body_node.add_child(div_node_three)
    div_node_two.add_child(p_node_1)
    div_node_two.add_child(p_node_2)
    p_node_2.add_child(b_node)
   end

   describe '#search' do

    it 'finds the root node when searching for it' do
      expect(html_tree.search {|item| item == 'body'}).to eq body_node
    end

    it 'finds the right div node when searching in first level' do
      expect(html_tree.search {|item| item == 'div'}).to eq div_node_one
    end

    it 'returns the correct node when searched for' do
      expect(html_tree.search {|item| item == 'b'}).to eq b_node
    end
  end
end

end