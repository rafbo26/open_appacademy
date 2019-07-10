require "employee"

class Startup
  
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
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
    else
      raise "Title invalid"
    end
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
      raise "Not enough funding"
    end
  end
  
  def payday
    @employees.each { |emp| pay_employee(emp) }
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
  end
  
  def acquire(startup)
    @funding += startup.funding
    @employees += startup.employees
    startup.close
    startup.salaries.each { |title, salary| @salaries[title] = salary if !valid_title?(title) }
  end
  
end
