class MyReptilesController < ApplicationController
    def top
      @user = User.find(params[:user_id]) # ユーザーを取得
      @reptiles = @user.my_reptiles # ユーザーに関連する Reptile を取得
    end

    def new
        @my_reptile = MyReptile.new
      end

      def create
        @my_reptile = MyReptile.new(my_reptile_params)
        @my_reptile.user = current_user # ログイン中のユーザーを関連付け

        if @my_reptile.save
          redirect_to my_reptiles_top_path, notice: "Reptile was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
    end

    private

    def my_reptile_params
      params.require(:my_reptile).permit(:name, :description, :image)
    end
end
