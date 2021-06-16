@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, leave the name blank and hit return again"
  name = gets.chomp
  while !name.empty? do
    puts "What chort does this student belong to?"
    cohort = gets.chomp
    @students << {name: name, cohort: cohort.empty? ? :permanent : cohort.to_sym }
    if @students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{@students.count} students"
    end
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.sort_by! { |student| student[:cohort] }
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name].center(30)} (#{student[:cohort]} cohort)"
  end
end

def print_beginning_with(letter)
  puts "students beginning with #{letter}:"
  @students.each do |student|
    if student[:name][0].upcase == letter
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_shorter_than_twelve
  puts "students with names shorter than 12 characters long:"
  @students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    selection = gets.chomp
    process(selection)
  end
end

interactive_menu