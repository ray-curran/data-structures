require_relative '../data-structures-array-list-challenge/array_list.rb'

class Node
  attr_reader :value, :children

  def initialize(value)
    @value = value
    @children = ArrayList.new(0)
  end

  def add_child(child)
    @children.add(child)
  end

  def search(&block)
    return self if yield(value)
    @children.length.times do |i|
      if @children[i].search(&block)
        return @children[i].search(&block)
      end
    end
    nil
  end

end