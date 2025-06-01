FactoryBot.define do
  factory :my_reptile do
    name { "テストヘビ" }
    species { "ボールパイソン" }
    morph { "ノーマル" }
    birthday { Date.today - 1.year }
    adoption_date { Date.today }
    association :user
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.jpg'), 'image/jpeg') }
  end
end