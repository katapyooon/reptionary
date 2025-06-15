FactoryBot.define do
    factory :wishlist_reptile do
      species { "レオパードゲッコー" }
      morph { "ノーマル" }
      priority { 1 }
      memo { "テストメモ" }
      association :user
    end
  end