Rails.application.routes.draw do
  devise_for :users

  # ログイン後のルートを設定
  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end

  # ログインしていない場合のルートを設定
  devise_scope :user do
    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  # その他のルート
  get "/manifest.json", to: "application#manifest"
  get "home/index"

  # ユーザーごとの my_reptiles ページ
  get "users/:user_id/my_reptiles", to: "my_reptiles#top", as: :user_my_reptiles

  # ユーザーの爬虫類を作成・表示するページ
  get "create_my_reptile", to: "my_reptiles#new", as: :new_my_reptile
  post "create_my_reptile", to: "my_reptiles#create", as: :create_my_reptile

  # マイページの爬虫類一覧
  get "my_reptiles/top", to: "my_reptiles#top", as: :my_reptiles_top
  resources :my_reptiles, only: [ :new, :create ]
end
