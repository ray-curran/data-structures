require_relative 'fixed_arrays'

describe FixedArray do
  let(:fixed_array) { FixedArray.new(8)}

  it 'creates an array of a certain size' do
    expect(fixed_array.size).to eq 8
  end

  it 'returns the right size when initiated' do
    expect(FixedArray.new(4).size).to eq 4
  end

  it 'puts new elements in the correct position' do
    fixed_array.set(3, "hai")
    expect(fixed_array[3]).to eq 'hai'
  end

  it 'gets the correct element at a given position' do
    fixed_array.set(4, 'bai')
    expect(fixed_array.get(4)).to eq 'bai'
  end

  it 'raises an out of bounds exception when you try to get an out of bounds index' do
    expect{fixed_array.set(9, 'hai')}.to raise_error{OutOfBoundsException}
  end

  it 'raises an out of bounds exception when you try to get an out of bounds index' do
    expect{fixed_array.set(-1, 'hai')}.to raise_error{OutOfBoundsException}
  end

  it 'raises an out of bounds exception when you try to set an out of bounds index' do
    expect{fixed_array.get(9)}.to raise_error{OutOfBoundsException}
  end

  it 'raises an out of bounds exception when you try to set an out of bounds index' do
    expect{fixed_array.get(-1)}.to raise_error{OutOfBoundsException}
  end

end
