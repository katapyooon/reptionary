class WishlistReptilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_wishlist_reptile, only: [:show, :edit, :update, :destroy]

  def index
    @wishlist_reptiles = @user.wishlist_reptiles
  end

  def new
    @wishlist_reptile = @user.wishlist_reptiles.build
  end

  def create
    @wishlist_reptile = @user.wishlist_reptiles.build(wishlist_reptile_params)
    if @wishlist_reptile.save
      redirect_to user_wishlist_reptiles_path(@user), notice: '欲しい爬虫類を登録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_wishlist_reptile
    @wishlist_reptile = @user.wishlist_reptiles.find(params[:id])
  end

  def wishlist_reptile_params
    params.require(:wishlist_reptile).permit(:species, :morph, :priority, :memo)
  end
end