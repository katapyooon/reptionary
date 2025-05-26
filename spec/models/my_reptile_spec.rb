require 'rails_helper'

RSpec.describe MyReptile, type: :model do
  it "is valid with valid attributes" do
    user = create(:user)
    my_reptile = MyReptile.new(
      name: "Gecko",
      description: "A small lizard",
      birthday: "2025-05-08",
      adoption_date: "2025-05-22",
      gender: "male",
      image: Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/files/sample_image.jpg"), "image/jpeg"),
      user: user
    )
    expect(my_reptile).to be_valid
  end
end
