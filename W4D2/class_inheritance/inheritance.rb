# Employee and Manager
# Write a class Employee that has attributes that return the employee's name, title, salary, and boss.

# Write another class, Manager, that extends Employee. Manager should have an attribute that holds an array of all employees assigned to the manager. Note that managers might report to higher level managers, of course.

# Add a method, bonus(multiplier) to Employee. Non-manager employees should get a bonus like this

# bonus = (employee salary) * multiplier
# Managers should get a bonus based on the total salary of all of their subordinates, as well as the manager's subordinates' subordinates, and the subordinates' subordinates' subordinates, etc.

# bonus = (total salary of all sub-employees) * multiplier
# Testing
# If we have a company structured like this:

# Name	Salary	Title	Boss
# Ned	\$1,000,000	Founder	nil
# Darren	\$78,000	TA Manager	Ned
# Shawna	\$12,000	TA	Darren
# David	\$10,000	TA	Darren
# then we should have bonuses like this:

# ned.bonus(5) # => 500_000
# darren.bonus(4) # => 88_000
# david.bonus(3) # => 30_000




class Employee
  def initialize(name, salary, title)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def bonus(multiplier)
    bonus = salary * multiplier
    bonus
  end

  def boss=(boss) 
    return if @boss == boss
    @boss = boss
    self
  end

  attr_accessor :name, :title, :salary, :boss
end

class Manager < Employee
  def initialize(name, salary, title)
    super
    @employees = []
  end

  def bonus_base
    base = 0

    @employees.each do |employee|
      if employee.class != Manager  ### if the employee object does not contain the employees class variable (not a manager)
        base += employee.salary  ### add the salary of the employee
      else
        base += employee.bonus_base + employee.salary
      end
    end

    base
  end

  def bonus(multiplier)
    bonus = bonus_base * multiplier
    bonus
  end


  def add_employee(employee_node) 
      employee_node.boss = self

      employees << employee_node
  end
  
  def remove_employee(employee_node)
      raise "Pretty sure it's against the labor laws to fire someone else's employee" if !@employees.include?(employee_node)
  
      employee_node.boss = nil
      @employees.delete(employee_node)
  end

  # def subordinate(name, title, salary, manager)
  #   if manager == true
  #     employee = Manager.new(name, title, salary, self.name)
  #   else
  #     employee = Employee.new(name, title, salary, self.name)
  #   end
  #   @employees << employee
  # end

    attr_accessor :employees
end

if __FILE__ == $PROGRAM_NAME
  ned = Manager.new("Ned", 1000000, "Founder")
  darren = Manager.new("Darren", 78000, "TA Manager")
  shawna = Employee.new("Shawna", 12000, "TA")
  david = Employee.new("David", 10000, "TA")
  ned.add_employee(darren)
  darren.add_employee(shawna)
  darren.add_employee(david)

  puts "#{ned.name} the #{ned.title} is awarded $#{ned.bonus(5)} bonus."
  puts "#{darren.name} the #{darren.title} is awarded $#{darren.bonus(5)} bonus."
  puts "#{david.name} the #{david.title} is awarded $#{david.bonus(5)} bonus."

end