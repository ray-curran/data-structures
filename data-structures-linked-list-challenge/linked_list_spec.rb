require_relative 'linked_list'

describe LinkedList do

  let(:linked_list) {LinkedList.new}

  def add_three_elements
    linked_list.insert_first('hai')
    linked_list.insert_first('bai')
    linked_list.insert_last('will it blend')
  end


  describe '#initialize' do
    it 'initializes with no node at the beginning' do
      expect(linked_list.first_node).to eq nil
    end
  end

  describe '#insert_first' do
    it 'puts a node at the beginning of the list' do
      linked_list.insert_first('hai')
      expect(linked_list.first_node).to be_a Node
    end

    it 'stores the right data in the first node space' do
      linked_list.insert_first('hai')
      expect(linked_list.first_node.element).to eq 'hai'
    end

    it 'bumps others to the second node if there is already one there' do
      linked_list.insert_first('hai')
      linked_list.insert_first('bai')
      expect(linked_list.first_node.element).to eq 'bai'
      expect(linked_list.first_node.next_node.element).to eq 'hai'
    end
  end

  describe '#remove_first' do
    it 'changes the first element to one when there is one element in the list' do
      linked_list.insert_first('hai')
      linked_list.remove_first
      expect(linked_list.first_node).to eq nil
    end

    it 'moves the second element up to the first when there are multiple in the list' do
      linked_list.insert_first('hai')
      linked_list.insert_first('bai')
      linked_list.remove_first
      expect(linked_list.first_node.element).to eq 'hai'
    end
  end

  describe '#insert_last' do
    it 'adds an element to the beginning of the list if it is empty' do
      linked_list.insert_last('hai')
      expect(linked_list.first_node.element).to eq 'hai'
    end

    it 'adds the element at the end of the list if it is already filled up' do
      add_three_elements
      expect(linked_list.first_node.next_node.next_node.element).to eq 'will it blend'
    end
  end

  describe '#remove_last' do
    it 'removes the first element in the list if there is only one' do
      linked_list.insert_first('hai')
      linked_list.remove_last
      expect(linked_list.first_node).to eq nil
    end

    it 'removes the last element if there are multiple in the list' do
      add_three_elements
      linked_list.remove_last
      expect(linked_list.first_node.next_node.next_node).to eq nil
    end

    it 'will not break if the list is currently empty' do
      linked_list.remove_last
      expect(linked_list.first_node).to eq nil
    end
  end

  describe '#get' do
    it 'returns nil if there is nothing on the list' do
      expect(linked_list.get(3)).to eq nil
    end

    it 'returns nil if you give it something outside of the range of the list' do
      linked_list.insert_first('hai')
      expect(linked_list.get(3)).to eq nil
    end

    it 'returns the first element if you give it a 0 as an index' do
      linked_list.insert_first('hai')
      expect(linked_list.get(0)).to eq 'hai'
    end

    it 'returns the third element if you give it 2 as an index' do
      add_three_elements
      expect(linked_list.get(2)).to eq 'will it blend'
    end
  end

  describe '#set' do
    it 'returns nil for an empty list when you try to set it' do
      expect(linked_list.set(3, 4)).to eq nil
    end

    it 'returns nil when there is a list but it goes too far' do
      add_three_elements
      expect(linked_list.set(5, 3)).to eq nil
    end

    it 'changes the value of an item at the given index when called' do
      add_three_elements
      expect{linked_list.set(1, 'scissors')}.to change{linked_list.get(1)}.from('hai').to('scissors')
    end

    it 'does not change the length of the list' do
      add_three_elements
      linked_list.set(1, 'scissors')
      expect(linked_list.size).to eq 3
    end
  end

  describe '#size' do
    it 'returns the correct size when it is a blank list' do
      expect(linked_list.size).to eq 0
    end

    it 'returns the correct size for a populated list' do
      add_three_elements
      expect(linked_list.size).to eq 3
    end

  end

  describe '#insert' do
    it 'adds one element to an empty list' do
      linked_list.insert(0, 'hai')
      expect(linked_list.first_node.element).to eq 'hai'
    end

    it 'returns nil if the requested index is out of range' do
      linked_list.insert(9, 'bai')
      expect(linked_list.first_node).to eq nil
    end

    it 'moves other items down if an item is inserted at the beginning of the list' do
      add_three_elements
      linked_list.insert(0, 'scissors')
      expect(linked_list.first_node.element).to eq 'scissors'
    end

    it 'moves other items around it but remains linked if inserted in the middle of a list' do
      add_three_elements
      linked_list.insert(1, 'scissors')
      expect(linked_list.get(1)).to eq 'scissors'
    end
  end

end
