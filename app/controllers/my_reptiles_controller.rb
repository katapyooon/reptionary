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

        Rails.logger.debug "Uploaded image: #{params[:my_reptile][:image].inspect}"

        if @my_reptile.save
          redirect_to my_reptiles_top_path(user_id: current_user.id), notice: "Reptile was successfully created."
        else
          render :new, status: :unprocessable_entity
        end
    end

    private

    def my_reptile_params
        params.require(:my_reptile).permit(:image, :name, :birthday, :adoption_date, :gender)
    end
end
