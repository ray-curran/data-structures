require_relative '../data-structures-linked-list-challenge/linked_list'

class Queue
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def enqueue(element)
    @list.insert_last(element)
  end

  def dequeue
    @list.remove_first
  end

  def peel
    @list.get(0)
  end

  def empty?
    @list.first_node == nil
  end
end
