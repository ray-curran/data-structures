require_relative '../data-structures-linked-list-challenge/linked_list'

class Stack
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def push(element)
    @list.insert_first(element)
  end

  def pop
    @list.remove_first
  end

  def top
    @list.get(0)
  end

  def empty?
    @list.first_node == nil
  end

end

# Reverse Polish Notation Calculator

def polish(string)
  stack = Stack.new
  split_string = string.split(' ')
  split_string.each do |item|
    if ['-', '*', '+', '/'].include?(item)
      first = stack.pop
      stack.push(stack.pop.send(item, first))
    else
      stack.push(item.to_i)
    end
  end
  return stack.top
end

