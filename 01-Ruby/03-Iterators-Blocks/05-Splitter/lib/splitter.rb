def size_splitter(array, size)
  # TODO: Return an array of two arrays, the first containing
  #       words of length `size`, the second containing all the other words
  #       In addition to this split, each array should be *sorted*.
  first_array = array.select { |word| word.length == size }.sort
  second_array = array.reject { |word| word.length == size }.sort
  return [first_array, second_array]
end

def block_splitter(array)
  # TODO: Return an array of two arrays, the first containing
  #       elements for which the given block yields true,
  #       the second containing all the other elements.
  #       No sort needed this time.
  first_array = array.select { |word| yield(word) }.sort
  second_array = array.reject { |word| yield(word) }.sort
  return [first_array, second_array]
end
