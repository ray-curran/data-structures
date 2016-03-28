class FixedArray

  def initialize(size)
    @container = Array.new(size)
  end

  def set(index, element)
    raise OutOfBoundsException if index > size - 1 || index < 0
    @container[index] = element
  end

  def size
    @container.length
  end

  def [](index)
    @container[index]
  end

  def get(index)
    raise OutOfBoundsException if index > size - 1 || index < 0
    @container[index]
  end

end

class OutOfBoundsException < Exception
end