require 'rails_helper'
require 'seed_data_helper'

describe User, type: :model do
  before do
    extend SeedData
  end

  it "should find a UserRole based on a user and a role as a String" do
    user_role = @austin.as_a "Customer"
    expect(user_role.role).to eq(@customer)

  end

  it "should find a UserRole based on a user and a role as an Object" do
    user_role = @austin.as_a @customer
    expect(user_role.role).to eq(@customer)
  end
end
