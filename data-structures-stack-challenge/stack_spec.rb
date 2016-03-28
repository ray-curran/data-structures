require_relative 'stack'

describe Stack do

  let(:stack) {Stack.new}

  def add_two_elements
    stack.push('hai')
    stack.push('bai')
  end

  describe '#new' do
    it 'initiates with a new blank linked list' do
      expect(stack.list).to be_a LinkedList
    end
  end

  describe '#push' do
    it 'adds the first element to the front of a stack when empty' do
      stack.push('hai')
      expect(stack.list.first_node.element).to eq 'hai'
    end

    it 'moves elements down in the stack when adding to a populated stack' do
      add_two_elements
      expect(stack.list.first_node.element).to eq 'bai'
      expect(stack.list.first_node.next_node.element).to eq 'hai'
    end
  end

  describe '#pop' do
    it 'removes the first element in the stack and returns it when populated' do
      add_two_elements
      expect(stack.pop).to eq 'bai'
    end

    it 'moves other elements to the top of the stack when popped' do
      add_two_elements
      stack.pop
      expect(stack.list.first_node.element).to eq 'hai'
    end

    it 'returns nil when nothing is in the stack' do
      expect(stack.pop).to eq nil
    end
  end

  describe '#top' do
    it 'returns nil for an empty stack' do
      expect(stack.top).to eq nil
    end

    it 'returns the top of the stack' do
      add_two_elements
      expect(stack.top).to eq 'bai'
    end

    it 'leaves the element at the top of the stack' do
      add_two_elements
      stack.top
      expect(stack.top).to eq 'bai'
    end
  end

  describe '#empty' do
    it 'returns true for an empty stack' do
      expect(stack.empty?).to eq true
    end

    it 'returns false for a non-empty stack' do
      add_two_elements
      expect(stack.empty?).to eq false
    end
  end

  describe '#polish' do
    it 'calculates the right number' do
      expect(polish('2 3 11 + 5 - *')).to eq 18
    end
  end

end
