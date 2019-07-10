
require_relative "employee"
require_relative "startup"

print "Enter a name of your startup: "
name = gets.chomp
print "Enter funding of your startup: "
funding = gets.chomp.to_i
salaries = { "CEO"=>250000, "CTO"=>200000, "SE"=>100000 }

STARTUP = Startup.new(name, funding, salaries)

def add_title
  next_title = true
  while true
    print "Add new title: "
    title_name = gets.chomp
    print "Add salary for #{title_name}: "
    title_salary = gets.chomp.to_i
    STARTUP.salaries[title_name] = title_salary
    print "Add another title? (y/n): "
    input = gets.chomp
    if input.downcase == "n"
      break
    end
  end
end

def hire
  print "Enter a name of your employee: "
  emp_name = gets.chomp
  print "Enter a title of your employee: "
  emp_title = gets.chomp
  print "Hire #{emp_name} as #{emp_title}? (y/n): "
  emp_decision = gets.chomp
  if emp_decision == "y"
    STARTUP.hire(emp_name, emp_title)
  else
    puts "Recrutation cancelled"
  end
end


while STARTUP.active
  puts
  puts "(E) See current staff."
  puts "(H) Hire new employee."
  puts "(P) Pay out the salaries."
  puts "(T) Add new title."
  puts "(F) Check current finances."
  puts "(C) Close down your startup."
  puts
  print "Select one option from above: "
  selected_option = gets.chomp.upcase

  if selected_option == "E"
    STARTUP.print_emps
  elsif selected_option == "H"
    STARTUP.print_titles
    hire
  elsif selected_option == "P"
    STARTUP.payday
  elsif selected_option == "C"
    STARTUP.close
  elsif selected_option == "T"
    add_title
  elsif selected_option == "F"
    STARTUP.print_funding
  end

end