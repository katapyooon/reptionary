require 'rails_helper'

RSpec.describe "WishlistReptiles", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /index" do
    it "returns http success" do
      get user_wishlist_reptiles_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:wishlist_reptile) { create(:wishlist_reptile, user: user) }

    it "returns http success" do
      get user_wishlist_reptile_path(user, wishlist_reptile)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get new_user_wishlist_reptile_path(user)
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    let(:valid_attributes) { attributes_for(:wishlist_reptile) }

    it "creates a new wishlist reptile" do
      expect {
        post user_wishlist_reptiles_path(user), params: { wishlist_reptile: valid_attributes }
      }.to change(WishlistReptile, :count).by(1)
      expect(response).to redirect_to(user_wishlist_reptiles_path(user))
    end
  end

  describe "GET /edit" do
    let(:wishlist_reptile) { create(:wishlist_reptile, user: user) }

    it "returns http success" do
      get edit_user_wishlist_reptile_path(user, wishlist_reptile)
      expect(response).to have_http_status(:success)
    end
  end
end
