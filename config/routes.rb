Rails.application.routes.draw do
  get "wishlist_reptiles/index"
  get "wishlist_reptiles/show"
  get "wishlist_reptiles/new"
  get "wishlist_reptiles/create"
  get "wishlist_reptiles/edit"
  get "wishlist_reptiles/update"
  get "wishlist_reptiles/destroy"
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
  resources :my_reptiles, only: [ :new, :create, :destroy, :show ] do
    collection do
      get "my_reptiles/top", to: "my_reptiles#top", as: :my_reptiles_top
    end
  end

  # wishlist_reptiles のルーティング
  resources :users do
    resources :wishlist_reptiles
  end

  get "/my_reptiles/:id/edit", to: "my_reptiles#edit", as: "edit_my_reptile"
  patch "/my_reptiles/:id", to: "my_reptiles#update", as: "update_my_reptile"

  get "my_reptiles/top/:user_id", to: "my_reptiles#top", as: "my_reptiles_top"
  resources :my_reptiles
end
