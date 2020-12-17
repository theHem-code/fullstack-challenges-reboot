require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.5.3/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.5.3/String.html#method-i-chomp



# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
students = []

puts "Type a student name:"
user_input = gets.chomp

while user_input != ""
  students.push(user_input)
  puts "Type another student name or press enter to finish:"
  user_input = gets.chomp
end
sorted_students = wagon_sort(students)
num_students = students.count

def plural(num, word)
  if num == 1
    "#{word} "
  else
    "#{word}s"
  end
end

puts "Congratulations! Your Wagon has #{students.count} #{plural(num_students, 'student')}:"
if sorted_students.count >= 2
  puts "#{sorted_students[0..-2].join(', ')} and #{sorted_students.last}"
else
  puts sorted_students.first
end
