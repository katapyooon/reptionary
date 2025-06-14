FactoryBot.define do
    factory :wishlist_reptile do
      name { "Test Reptile" }
      species { "Test Species" }
      description { "Test Description" }
      desired_price { 10000 }
      priority { 1 }
      notes { "Test Notes" }
      association :user
    end
  end
