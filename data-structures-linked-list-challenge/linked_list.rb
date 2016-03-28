require_relative 'node'

class LinkedList

  attr_reader :first_node

  def initialize
    @first_node = nil
  end

  def insert_first(element)
    if @first_node == nil
      @first_node = Node.new(element)
    else
      bumped_node = @first_node.dup
      @first_node = Node.new(element)
      @first_node.insert_after(bumped_node)
    end
  end

  def remove_first
    return nil if @first_node == nil
    node_to_return = @first_node.dup
    if @first_node.next_node == nil
      @first_node = nil
    else
      @first_node = @first_node.next_node
    end
    node_to_return.element
  end

  def insert_last(element)
    if @first_node == nil
      insert_first(element)
    else
      get_last_element.insert_after(Node.new(element))
    end
  end

  def remove_last
    if @first_node == nil || @first_node.next_node == nil
      @first_node = nil
    else
      get_next_to_last_element.remove_after
    end
  end

  def get(index)
    if first_node != nil
      return get_node_at_index(index).element if get_node_at_index(index) != nil
    else
      return nil
    end
  end

  def set(index, element)
    return nil if get_node_at_index(index) == nil
    get_node_at_index(index).element = element
  end

  def size
    counter = 0
    current = @first_node
    while current != nil
      counter += 1
      current = current.next_node
    end
    counter
  end

  def insert(index, element)
    if index == 0 && size == 0
      @first_node = Node.new(element)
    elsif index == 0
      bumped_element = @first_node.dup
      @first_node = Node.new(element)
      @first_node.insert_after(bumped_element)
    else
      return nil if get_node_at_index(index) == nil
      before_node = get_node_at_index(index - 1)
      bumped_node = get_node_at_index(index)
      new_node = Node.new(element)
      new_node.insert_after(bumped_node)
      before_node.insert_after(new_node)
    end
  end



  private

  def get_last_element
    selected_node = @first_node
    until selected_node.next_node == nil
      selected_node = selected_node.next_node
    end
    selected_node
  end

  def get_next_to_last_element
    selected_node = @first_node
    until selected_node.next_node.next_node == nil
      selected_node = selected_node.next_node
    end
    selected_node
  end

  def get_node_at_index(index)
    selected_node = @first_node
    index.times do
      return nil if @first_node == nil || selected_node.next_node == nil
      selected_node = selected_node.next_node
    end
    selected_node
  end

end
