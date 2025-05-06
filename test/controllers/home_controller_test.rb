require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers # Devise のテストヘルパーをインクルード

  def setup
    @user = users(:one) # テスト用のユーザーをフィクスチャから取得
    sign_in @user       # ユーザーをログイン
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end
end
