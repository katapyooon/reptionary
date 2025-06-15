FactoryBot.define do
    factory :wishlist_reptile do
      species { "レオパードゲッコー" }
      morph { "ノーマル" }
      priority { 1 }
      memo { "欲しい爬虫類のメモ" }
      association :user
    end
  end
