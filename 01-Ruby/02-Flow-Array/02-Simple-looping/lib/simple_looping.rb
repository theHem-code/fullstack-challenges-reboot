def sum_with_for(min, max)
  # CONSTRAINT: you should use a for..end structure
  array = (min..max).to_a
  sum = 0
  return -1 if min > max

  for num in array
    sum += num
  end
  return sum
end

def sum_with_while(min, max)
  # CONSTRAINT: you should use a while..end structure
  return -1 if min > max

  sum = 0
  i = min

  while i <= max
    sum += i
    i += 1
  end
  return sum
end
