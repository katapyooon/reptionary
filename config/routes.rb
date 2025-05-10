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
  get 'users/:user_id/my_reptiles', to: 'my_reptiles#top', as: :user_my_reptiles
end
