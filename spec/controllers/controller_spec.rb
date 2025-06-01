require 'rails_helper'

RSpec.describe MyReptilesController, type: :controller do
  let(:user) { create(:user) }
  let!(:my_reptile) { create(:my_reptile, user: user) }

  before do
    sign_in user
  end

  describe 'DELETE #destroy' do
    it '爬虫類が削除される' do
      expect {
        delete :destroy, params: { id: my_reptile.id }, format: :turbo_stream
      }.to change(MyReptile, :count).by(-1)
    end
  end
end
