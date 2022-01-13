class Division

  attr_reader :name, :departments

  def initialize(name)
    @name = name
    @departments = []
  end

  def add_department(department)
    @departments << department
  end

  def departments_with_multiple_employees
    @departments.select do |department|
      department.employees.count >=2
    end
  end

  def all_employees_names
    employees_names = []
    @departments.each do |department|
      department.employees.each do |employee|
        employees_names << employee.name
      end
    end
    employees_names
  end

  def employees_names_by_department
    employee_list = {}
    @departments.each do |department|
      if !employee_list.has_key?(department.name)
        employee_list[department.name] = []
      end
      department.employees.each do |employee|
        employee_list[department.name] << employee.name
      end
    end
    employee_list
  end

end
