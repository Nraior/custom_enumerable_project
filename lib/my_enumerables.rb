module Enumerable
  def my_each_with_index
    index = 0
    for element in self
      yield(element, index)
      index += 1
    end
  end

  def my_select
    elements_returned = []
    for element in self
      elements_returned << element if yield(element)
    end
    elements_returned
  end

  def my_all?
    for element in self
      return false unless  yield(element)
    end
    true
  end

  def my_any?
    for element in self
      return true if yield(element)
    end
    false
  end

  def my_none?
    for element in self
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    for element in self
      if block_given?
        count += 1 if yield(element)
      else
        count += 1
      end
    end
    count
  end

  def my_map
    updated_elements = []
    each do |element|
      updated_elements << yield(element)
    end
    updated_elements
  end

  def my_inject(arg)
    value = arg
    each do |number|
      value = yield(value, number)
    end
    value
  end
end

class Array
  def my_each
    for element in self
      yield(element)
    end
  end
end
