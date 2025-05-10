class MyReptilesController < ApplicationController
    def top
      @user = User.find(params[:user_id]) # ユーザーを取得
      @reptiles = @user.reptiles # ユーザーに関連する Reptile を取得
    end
end
