require 'rails_helper'

RSpec.describe "WishlistReptiles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/wishlist_reptiles/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/wishlist_reptiles/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/wishlist_reptiles/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/wishlist_reptiles/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/wishlist_reptiles/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/wishlist_reptiles/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/wishlist_reptiles/destroy"
      expect(response).to have_http_status(:success)
    end
  end
end
