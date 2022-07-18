require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーサインアップ" do
    let(:new_user) { create(:user) }

    context "入力値が正常なとき" do
      it "正しく登録できるとき" do
        expect(new_user).to be_valid
      end
    end

    context "入力値が正常ではないとき" do
      it "ユーザー名が正常でないとき" do
        name_blank_user = build(:test_user_tanaka, name: "" )
        expect(name_blank_user).not_to be_valid
      end

      it "メールアドレスが正常でないとき" do
        error_new_user = build(:test_user_tanaka, email: "test.example.com")
        expect(error_new_user).not_to be_valid
      end

      it "同じメールアドレスで登録できないとき" do
        first_user = build(:test_user_tanaka)
        same_email_user = build(:test_user_tanaka, name: "佐藤 次郎")
        first_user.save
        expect(first_user).to be_valid
        expect(same_email_user).not_to be_valid
      end
    end
  end
end
