class MyReptilesController < ApplicationController
    def top
      @my_reptiles = current_user.my_reptiles.all
    end

    def new
        @my_reptile = MyReptile.new
      end

    def create
        @my_reptile = MyReptile.new(my_reptile_params)
        @my_reptile.user = current_user

        if @my_reptile.save
          # 成功時は my_reptiles_top_path にリダイレクト
          redirect_to my_reptiles_top_path(user_id: current_user.id), notice: "爬虫類を登録しました"
        else
          render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @my_reptile = MyReptile.find(params[:id])
        if @my_reptile.user == current_user # ユーザーが所有者であることを確認
          @my_reptile.destroy
          redirect_to my_reptiles_top_path(user_id: current_user.id), notice: "Reptile was successfully deleted."
        else
          redirect_to my_reptiles_top_path(user_id: current_user.id), alert: "Failed to delete reptile."
        end
    end

    def show
        @my_reptile = MyReptile.find(params[:id])
    end

    private

    def my_reptile_params
      params.require(:my_reptile).permit(
        :name, :image, :description, :birthday, :adoption_date, :gender,
        :crop_x, :crop_y, :crop_width, :crop_height
      )
    end
end
