class Tree
  attr_reader :root

  def initialize(node)
    @root = node
  end

  def search(&block)
    root.search(&block) if root
  end

end