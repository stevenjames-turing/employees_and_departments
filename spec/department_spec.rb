require './lib/employee'
require './lib/department'

RSpec.describe Department do
  let (:customer_service) {Department.new("Customer Service")}
  let (:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let (:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}

  it 'exists' do
    expect(customer_service).to be_instance_of Department
  end

  it 'initializes with a name and no employees' do
    expect(customer_service.name).to eq("Customer Service")
    expect(customer_service.employees).to eq([])
  end

  it 'can hire employees and add to employees array' do
    expect(customer_service.employees).to eq([])

    customer_service.hire(bobbi)
    customer_service.hire(aaron)

    expect(customer_service.employees).to eq([bobbi, aaron])
  end

  it 'initializes with no expenses and can add expenses' do
    expect(customer_service.expenses).to eq(0)

    customer_service.expense(100)
    customer_service.expense(25)

    expect(customer_service.expenses).to eq(125)
  end
end
