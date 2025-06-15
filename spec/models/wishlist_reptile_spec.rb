require 'rails_helper'

RSpec.describe WishlistReptile, type: :model do
  let(:user) { create(:user) }
  let(:wishlist_reptile) { create(:wishlist_reptile, user: user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(wishlist_reptile).to be_valid
    end

    it 'is not valid without a species' do
      wishlist_reptile.species = nil
      expect(wishlist_reptile).not_to be_valid
    end

    it 'is valid without a morph' do
      wishlist_reptile.morph = nil
      expect(wishlist_reptile).to be_valid
    end

    it 'is valid without a priority' do
      wishlist_reptile.priority = nil
      expect(wishlist_reptile).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      expect(wishlist_reptile.user).to eq(user)
    end
  end
end