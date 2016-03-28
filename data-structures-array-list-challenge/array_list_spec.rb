require_relative 'array_list'

describe ArrayList do

  let(:array_list) {ArrayList.new(6)}

  describe '#new' do
    it 'creates a new Array List of a specific size' do
      expect(ArrayList.new(5).length).to eq 5
    end
  end

  describe '#add' do
    it 'increases the length of the array list' do
      expect{array_list.add('hai')}.to change{array_list.length}.from(6).to(7)
    end

    it 'adds the element to the end of the list' do
      array_list.add('bai')
      expect(array_list[6]).to eq 'bai'
    end
  end

  describe '#get' do
    it 'raises an out of bounds exception when the value is out of range' do
      expect{array_list.get(9)}.to raise_error{OutOfBoundsException}
    end

    it 'returns the correct element in a list when called' do
      array_list.set(4, 'hai')
      expect(array_list.get(4)).to eq 'hai'
    end
  end

  describe '#set' do
    it 'raises an out of bounds exception when the value is out of range' do
      expect{array_list.set(9, 'bai')}.to raise_error{OutOfBoundsException}
    end

    it 'sets the correct element in a list when called' do
      expect{array_list.set(4, 'hai')}.to change{array_list[4]}.from(nil)
    end

    it 'returns the element it sets' do
      expect(array_list.set(4, 'hai')).to eq 'hai'
    end
  end

  describe '#length' do
    it 'returns the correct size when called' do
      expect(array_list.length).to eq 6
    end
  end

  describe '#insert' do
    it 'raises an out of bounds exception when the value is out of range' do
      expect{array_list.insert(9, 'bai')}.to raise_error{OutOfBoundsException}
    end

    it 'puts the new element at the location specified' do
      array_list.insert(3, 'bai')
      expect(array_list.get(3)).to eq 'bai'
    end

    it 'moves other elements to the right' do
      array_list.set(3, 'hai')
      array_list.set(5, 'will it blend')
      array_list.insert(3, 'bai')
      expect(array_list.get(4)).to eq 'hai'
      expect(array_list.get(6)).to eq 'will it blend'
    end

    it 'increases the length of the array list' do
      expect{array_list.insert(3, 'blah')}.to change{array_list.length}.from(6).to(7)
    end
  end

end

