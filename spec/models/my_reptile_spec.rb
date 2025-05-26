require 'rails_helper'

RSpec.describe MyReptile, type: :model do
  let(:user) { User.create!(email: "test@example.com", password: "password") }

  it "is valid with valid attributes" do
    my_reptile = MyReptile.new(
      name: "Gecko",
      description: "A small lizard",
      birthday: "2025-05-08",
      adoption_date: "2025-05-22",
      gender: "male",
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/sample_image.jpg"), "image/jpeg"),
      user: create(:user)
    )
    expect(my_reptile).to be_valid
  end
end
