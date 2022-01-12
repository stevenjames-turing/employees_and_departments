require './lib/employee'
require './lib/department'

RSpec.describe Department do
  let(:customer_service) {Department.new("Customer Service")}

  it 'exists' do
    expect(customer_service).to be_instance_of Department
  end

  it 'initializes with a name and no employees' do
    expect(customer_service.name).to eq("Customer Service")
    expect(customer_service.employees).to eq([])
  end
end 
