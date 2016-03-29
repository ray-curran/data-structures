class Node
  attr_reader :value, :nodes

  def initialize(value)
    @value = value
    @nodes = []
  end

  def add_edge(other_node)
    @nodes << other_node
  end

  def exists?(&block)
    @nodes.each do |node|
      return true if yield(node)
      return true if node.exists?(&block) == true
    end
    false
  end

end
