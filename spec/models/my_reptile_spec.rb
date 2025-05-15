require 'rails_helper'

RSpec.describe MyReptile, type: :model do
  it "is valid with valid attributes" do
    user = User.create!(email: "test@example.com", password: "password")
    my_reptile = MyReptile.new(name: "Gecko", description: "A small lizard", user: user)
    expect(my_reptile).to be_valid
  end
end