require_relative 'node'

describe Node do
  let(:node) {Node.new('hai')}

  describe '#initialize' do
    it 'has an assigned value' do
     expect(node.value).to eq 'hai'
   end

   it 'initializes with a blank array of edges' do
    expect(node.nodes.length).to eq 0
   end
 end

 describe '#add_edge' do
  it 'increases the number of edges' do
    expect{node.add_edge(Node.new('bai'))}.to change{node.nodes.length}.from(0).to(1)
  end

  it 'adds the appropriate element as an edge for the new node' do
    node.add_edge(Node.new('bai'))
    expect(node.nodes[0].value).to eq 'bai'
  end
 end

  let(:matt) {Node.new('matt')}
  let(:mike) {Node.new('mike')}
  let(:duke) {Node.new('duke')}
  let(:ray) {Node.new('ray')}
  let(:alyssa) {Node.new('alyssa')}

  before do
    matt.add_edge(mike)
    mike.add_edge(ray)
    mike.add_edge(duke)
    duke.add_edge(alyssa)
  end

 describe '#exists' do
  it 'finds the right node when the node edges the other' do
    expect(matt.exists?{|node| node.value == 'mike'}).to be true
  end

  it 'finds the right node when the node is 3 away' do
    expect(matt.exists?{|node| node.value == 'alyssa'}).to be true
  end

  it 'does not find the node if it only edges that one direction' do
    expect(mike.exists?{|node| node.value == 'matt'}).to be false
  end
 end

end
