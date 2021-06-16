def input_students
  puts "Please enter the names of the students"
  puts "To finish, leave the name blank and hit return again"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What chort does this student belong to?"
    cohort = gets.chomp
    students << {name: name, cohort: cohort.empty? ? "permanent" : cohort }
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name].center(30)} (#{student[:cohort]} cohort)"
  end
end

def print_beginning_with(students, letter)
  puts "students beginning with #{letter}:"
  students.each do |student|
    if student[:name][0].upcase == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_shorter_than_twelve(students)
  puts "students with names shorter than 12 characters long:"
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)