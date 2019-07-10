class Startup
  
  attr_reader :name, :funding, :salaries, :employees, :active

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
    @active = true
  end
  
  def valid_title?(title)
    @salaries.has_key?(title)
  end
  
  def >(startup)
    self.funding > startup.funding
  end

  def hire(name, title)
    if valid_title?(title)
      @employees << Employee.new(name, title)
      puts "\n#{name} was successfully hired as #{title}."
    else
      puts "Title invalid"
    end
  end

  def print_titles
    puts "------------------------------"
    puts "Available positions: "
    puts
    @salaries.each_key { |title| puts title }
    puts
    puts "------------------------------"
  end

  def print_emps
    puts "------------------------------"
    puts
    @employees.each { |emp| puts "Name: #{emp.name}, title: #{emp.title}. " }
    puts
    puts "------------------------------"
  end

  def print_funding
    puts
    puts "Current funding is: #{@funding}"
    puts
  end
  
  def size
    @employees.length
  end
  
  def pay_employee(employee)
    salary = @salaries[employee.title]
    if @funding >= salary
      employee.pay(salary)
      @funding -= salary
    else
      puts "Not enough funding"
    end
  end
  
  def payday
    @employees.each { |emp| pay_employee(emp) }
    puts "\nSalaries have been paid."
  end
  
  def average_salary
    sum = 0
    @employees.each do |emp|
      sum += salaries[emp.title]
    end
    sum / size
  end
  
  def close
    @employees = []
    @funding = 0
    @active = false
  end
  
  def acquire(startup)
    @funding += startup.funding
    @employees += startup.employees
    startup.close
    startup.salaries.each { |title, salary| @salaries[title] = salary if !valid_title?(title) }
  end
  
end
