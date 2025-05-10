class HomeController < ApplicationController
  def index
  end

  def my_reptiles
    # 必要に応じてデータを取得
    @reptiles = Reptile.all # 例: Reptile モデルからデータを取得
  end
end
