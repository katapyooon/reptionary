class WishlistReptilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @wishlist_reptiles = current_user.wishlist_reptiles
  end

  def new
    @wishlist_reptile = current_user.wishlist_reptiles.build
  end

  def create
    @wishlist_reptile = current_user.wishlist_reptiles.build(wishlist_reptile_params)

    if @wishlist_reptile.save
      redirect_to user_wishlist_reptiles_path(current_user), notice: "欲しい爬虫類を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def wishlist_reptile_params
    params.require(:wishlist_reptile).permit(:species, :morph, :priority, :memo)
  end
end
