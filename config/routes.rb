Rails.application.routes.draw do
  devise_for :users

  # ログイン後のルートを設定
  authenticated :user do
    root to: "home#index", as: :authenticated_root
  end

  # ログインしていない場合のルートを設定
  unauthenticated do
    root to: "devise/sessions#new", as: :unauthenticated_root
  end

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  # manifest.json のルートを追加
  get "/manifest.json", to: "application#manifest"

  get "home/index"
end
