require_relative '../fixed-arrays/fixed_arrays'

class ArrayList

  def initialize(size)
    @fixed_array = FixedArray.new(size)
  end

  def length
    @fixed_array.size
  end

  def [](index)
    @fixed_array[index]
  end

  def add(element)
    add_element
    @fixed_array.set(length - 1, element)
  end

  def set(index, element)
    @fixed_array.set(index, element)
  end

  def get(index)
    @fixed_array.get(index)
  end

  def insert(index, element)
    add_element
    move_stuff_over(index)
    set(index, element)
  end

  private
  def add_element
    @old_array = @fixed_array.dup
    @fixed_array = FixedArray.new(@old_array.size + 1)
    counter = 0
    @old_array.size.times do
      @fixed_array.set(counter, @old_array.get(counter))
      counter += 1
    end
  end

  def move_stuff_over(index)
    times_to_run = length - index - 1
    counter = length - 1
    while counter > index
      @fixed_array.set(counter, @fixed_array.get(counter - 1))
      counter -= 1
    end
  end

end
