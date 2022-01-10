require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:invalid_user_params) { attributes_for(:user, name: "") }

  describe "サインアップ" do
    before do
      ActionMailer::Base.deliveries.clear
    end

    context "入力値が正しいとき" do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it '認証メールが送信されること' do
        post user_registration_path, params: { user: user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 1
      end

      it 'createが成功すること' do
        expect do
          post user_registration_path, params: { user: user_params }
        end.to change(User, :count).by 1
      end

      it '認証ページへリダイレクトされること' do
        post user_registration_path, params: { user: user_params }
        expect(response).to redirect_to verify_path
      end
    end

    context '入力値が不正な場合' do
      it 'リクエストが成功すること' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(response.status).to eq 200
      end

      it '認証メールが送信されないこと' do
        post user_registration_path, params: { user: invalid_user_params }
        expect(ActionMailer::Base.deliveries.size).to eq 0
      end

      it 'createが失敗すること' do
        expect do
          post user_registration_path, params: { user: invalid_user_params }
        end.to_not change(User, :count)
      end
    end
  end

  # xdescribe "ログイン" do #処理を保留する
  #   let(:user) { create(:user, :confirmed) }

  #   context "ログインするとき" do
  #     it 'ログイン後#indexへページ遷移すること' do
  #       sign_in @user
  #       get users_path
  #       expect(response).to have_http_status(200)
  #     end

  #     it "ログインしないと#users/sign_upへリダイレクトすること" do
  #       get users_path
  #       expect(response).to redirect_to new_user_session_path
  #     end
  #   end

  #    context "未認証のとき" do
  #     let(:user) { create(:user) }
  #     it "ログインできないとき" do
  #       get users_path
  #       expect(response).to redirect_to
  #     end
  #    end
  # end
end
