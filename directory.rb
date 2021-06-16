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

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, chort.to_sym}  
  end
  file.close
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

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
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