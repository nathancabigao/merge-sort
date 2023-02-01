# frozen-string-literal: true

def merge_sort(array)
  # base case: return the element if it is alone/empty
  return array if array.size <= 1

  # Divide: split the arrays in half, sort those first
  half = (array.size / 2)
  array1 = merge_sort(array.slice(0...half))
  array2 = merge_sort(array.slice(half..array.size))

  # Conquer: merge the two sorted array halves
  merge_halves(array1, array2)
end

def merge_halves(array1, array2)
  sorted = []
  until array1.empty? || array2.empty?
    sorted << if array1[0] < array2[0]
                array1.shift
              else
                array2.shift
              end
  end
  sorted.concat(array1).concat(array2)
end

sample = [3, 2, 8, 7, 1, 4, 5, 3]
puts "Sorting #{sample.inspect}!"
p merge_sort(sample)
