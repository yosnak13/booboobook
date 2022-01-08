require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "ログイン" do
    before do
      @user = create(:test_user_tanaka)
      @character = create(:character)
    end

    context "ログインするとき" do
      it 'ログイン後#indexへページ遷移すること' do
        sign_in @user
        get users_path
        expect(response).to have_http_status(200)
      end

      it "ログインしないと#users/sign_upへリダイレクトすること" do
        get users_path
        expect(response).to redirect_to new_user_session_path
        expect(response).to have_http_status(200)
      end
    end
  end
end
