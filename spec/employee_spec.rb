require './lib/employee'

RSpec.describe Employee do
  let (:bobbi) {Employee.new({name: "Bobbi Jaeger", age: "30", salary: "100000"})}
  let (:aaron) {Employee.new({name: "Aaron Tanaka", age: "25", salary: "90000"})}

  it 'exists' do
    expect(bobbi).to be_instance_of Employee
  end

  it 'initializes with a name, age, and salary' do
    expect(bobbi.name).to eq("Bobbi Jaeger")
    expect(bobbi.age).to eq(30)
    expect(bobbi.salary).to eq(100000)
  end
end
