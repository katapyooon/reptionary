require 'rails_helper'

RSpec.describe "MyReptiles", type: :system do
  let(:user) { create(:user) }
  let!(:reptile) { create(:my_reptile, user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
    visit my_reptiles_top_path(user_id: user.id)
  end

  describe 'トップページの表示' do
    it '爬虫類一覧が表示される' do
      within('.my-reptiles-top') do
        expect(page).to have_content('My Reptiles')
        expect(page).to have_content(reptile.name)
      end
    end

    it '爬虫類追加ボタンが表示される' do
      within('.reptiles-grid') do
        expect(page).to have_link('爬虫類を追加')
      end
    end
  end
end