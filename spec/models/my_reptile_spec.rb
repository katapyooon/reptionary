require 'rails_helper'

RSpec.describe MyReptile, type: :model do
  it "is valid with valid attributes" do
    my_reptile = build(:my_reptile)
    expect(my_reptile).to be_valid
  end
end