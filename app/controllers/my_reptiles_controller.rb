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

      if @my_reptile.user == current_user
        if @my_reptile.destroy
          respond_to do |format|
            format.html { redirect_to my_reptiles_top_path(user_id: current_user.id), notice: "削除しました" }
            format.turbo_stream
          end
        else
          respond_to do |format|
            format.html { redirect_to my_reptiles_top_path(user_id: current_user.id), alert: "削除に失敗しました" }
            format.turbo_stream { render turbo_stream: turbo_stream.replace("reptile-#{@my_reptile.id}", partial: "reptile", locals: { reptile: @my_reptile }) }
          end
        end
      else
        redirect_to my_reptiles_top_path(user_id: current_user.id), alert: "権限がありません"
      end
    end

    def show
        @my_reptile = MyReptile.find(params[:id])
    end

    def edit
      @my_reptile = MyReptile.find(params[:id])
    end

    def update
      @my_reptile = MyReptile.find(params[:id])
      if @my_reptile.update(my_reptile_params)
        redirect_to my_reptile_path(@my_reptile), notice: "更新しました"
      else
        render :edit
      end
    end

    private

    def my_reptile_params
      params.require(:my_reptile).permit(
        :name, :species, :morph, :birthday, :adoption_date, :gender,
        :image, :crop_x, :crop_y, :crop_width, :crop_height
      )
    end
end
