class ApplicationController < ActionController::Base
  before_action :authenticate_user! # 全てのページでログインを必須にする

  def after_sign_in_path_for(resource)
    home_index_path # ログイン後のリダイレクト先を設定
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path # ログアウト後にログイン画面に遷移
  end

  def manifest
    render json: {
      name: "My App",
      short_name: "App",
      start_url: "/",
      display: "standalone",
      background_color: "#ffffff",
      theme_color: "#000000",
      icons: [
        {
          src: "/icon.png",
          sizes: "192x192",
          type: "image/png"
        }
      ]
    }
  end
end
