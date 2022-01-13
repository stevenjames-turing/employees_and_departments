require './lib/employee'
require './lib/department'
require './lib/division'

RSpec.describe Division do
  let (:midwest) {Division.new("Midwest")}
  let (:customer_service) {Department.new("Customer Service")}
  let (:human_resources) {Department.new("Human Resources")}
  let (:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let (:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}
  let (:steven) {Employee.new({name: "Steven James", age: "34", salary: "0"})}
  let (:ashley) {Employee.new({name: "Ashley Clark", age: "30", salary: "100000"})}

  it 'exists' do
    expect(midwest).to be_instance_of Division
  end

  it 'initializes with a name' do
    expect(midwest.name).to eq("Midwest")
  end

  it 'initializes with no departments and can add departments' do
    expect(midwest.departments).to eq([])

    midwest.add_department(customer_service)
    expect(midwest.departments).to eq([customer_service])

    midwest.add_department(human_resources)
    expect(midwest.departments).to eq([customer_service, human_resources])
  end

  it 'can list all departments with multiple employees' do
    expect(midwest.departments).to eq([])
    expect(midwest.departments_with_multiple_employees).to eq([])

    midwest.add_department(customer_service)
    midwest.add_department(human_resources)

    customer_service.hire(bobbi)
    customer_service.hire(aaron)

    expect(midwest.departments).to eq([customer_service, human_resources])
    expect(midwest.departments_with_multiple_employees).to eq([customer_service])

    human_resources.hire(steven)
    human_resources.hire(ashley)

    expect(midwest.departments_with_multiple_employees).to eq([customer_service, human_resources])
  end

  it 'can list all employees names' do
    expect(midwest.all_employees_names).to eq([])

    midwest.add_department(customer_service)
    midwest.add_department(human_resources)
    customer_service.hire(bobbi)
    customer_service.hire(aaron)

    expect(midwest.all_employees_names).to eq(["Bobbi Jaeger", "Aaron Tanaka"])

    human_resources.hire(steven)
    human_resources.hire(ashley)

    expect(midwest.all_employees_names).to eq(["Bobbi Jaeger", "Aaron Tanaka", "Steven James", "Ashley Clark"])
  end

  it 'can list employees names by department as a hash' do
    midwest.add_department(customer_service)
    midwest.add_department(human_resources)
    customer_service.hire(bobbi)
    customer_service.hire(aaron)
    human_resources.hire(steven)
    human_resources.hire(ashley)
    expect(midwest.all_employees_names).to eq(["Bobbi Jaeger", "Aaron Tanaka", "Steven James", "Ashley Clark"])

    expected = {
      "Customer Service" => ["Bobbi Jaeger", "Aaron Tanaka"],
      "Human Resources" => ["Steven James", "Ashley Clark"]}

    expect(midwest.employees_names_by_department).to eq(expected)
  end

end
