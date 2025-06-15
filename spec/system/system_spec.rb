require 'rails_helper'

RSpec.describe "MyReptiles", type: :system do
  let(:user) { create(:user) }
  let!(:reptile) { create(:my_reptile, user: user) }

  before do
    driven_by(:rack_test)
    sign_in user
    visit user_my_reptiles_path(user)  # パスヘルパーを修正
  end

  describe 'トップページの表示' do
    it '爬虫類一覧が表示される' do
      within('.my-reptiles-top') do
        expect(page).to have_content('My Reptiles')
        expect(page).to have_css('.reptile-info h2', text: reptile.name)
      end
    end

    it '爬虫類追加ボタンが表示される' do
      within('.reptiles-grid') do
        expect(page).to have_link('爬虫類を追加', class: 'add-button')
      end
    end
  end
end
