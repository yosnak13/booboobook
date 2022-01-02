require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーサインアップ' do
    context '入力値が正常なとき' do
      it '正しく登録できるとき' do
        new_user = FactoryBot.create(:test_user_tanaka)
        expect(new_user).to be_valid
      end
    end

    context "入力値が正常ではないとき" do
      before do
        new_user = FactoryBot.create(:test_user_tanaka)
      end

      it 'メールアドレスが正常でないとき' do
        error_new_user = FactoryBot.build(:test_user_tanaka, email: 'test.example.com')
        expect(error_new_user).not_to be_valid
      end

      it '同じメールアドレスで登録できないとき' do
        same_email_user = FactoryBot.build(:test_user_tanaka, name: "佐藤 次郎")
        expect(same_email_user).not_to be_valid
      end
    end
  end
end
