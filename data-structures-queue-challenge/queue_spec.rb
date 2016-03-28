require_relative 'queue'

describe Queue do

   let(:queue) {Queue.new}

  def add_two_elements
    queue.enqueue('hai')
    queue.enqueue('bai')
  end

  describe '#new' do
    it 'initiates with a new blank linked list' do
      expect(queue.list).to be_a LinkedList
    end
  end

  describe '#enqueue' do
    it 'adds the first element to the front of a queue when empty' do
      queue.enqueue('hai')
      expect(queue.list.first_node.element).to eq 'hai'
    end

    it 'adds elements to the end of the queue as they are added' do
      add_two_elements
      expect(queue.list.first_node.element).to eq 'hai'
      expect(queue.list.first_node.next_node.element).to eq 'bai'
    end
  end

  describe '#dequeue' do
    it 'removes the first element in the queue and returns it when populated' do
      add_two_elements
      expect(queue.dequeue).to eq 'hai'
    end

    it 'moves other elements to the top of the queue when popped' do
      add_two_elements
      queue.dequeue
      expect(queue.list.first_node.element).to eq 'bai'
    end

    it 'returns nil when nothing is in the queue' do
      expect(queue.dequeue).to eq nil
    end
  end

  describe '#peel' do
    it 'returns nil for an empty queue' do
      expect(queue.peel).to eq nil
    end

    it 'returns the top of the queue' do
      add_two_elements
      expect(queue.peel).to eq 'hai'
    end

    it 'leaves the element at the top of the queue' do
      add_two_elements
      queue.peel
      expect(queue.peel).to eq 'hai'
    end
  end

  describe '#empty?' do
    it 'returns true for an empty queue' do
      expect(queue.empty?).to eq true
    end

    it 'returns false for a non-empty queue' do
      add_two_elements
      expect(queue.empty?).to eq false
    end
  end

end
