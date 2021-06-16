@students = []

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry,  #{filename} doesn't exist."
    exit
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def student_count
  if @students.count == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{@students.count} students"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, leave the name blank and hit return again"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "What chort does this student belong to?"
    cohort = STDIN.gets.chomp
    @students << {name: name, cohort: cohort.empty? ? :permanent : cohort.to_sym }
    student_count
    name = STDIN.gets.chomp
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

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  File.open("students.csv", "w") { |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  }
  puts "students saved to students.csv"
end

def load_students(filename = "students.csv")
  File.open(filename, "r") { |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}  
    end
  }
  puts "students loaded from #{filename}"
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
    selection = STDIN.gets.chomp
    process(selection)
  end
end

try_load_students
interactive_menu