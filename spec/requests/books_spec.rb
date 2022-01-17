require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { create(:user) }

  describe "書籍登録" do
    context "入力値がただしいとき" do
      before do
        book = build(:book)
      end

      it "書籍の登録が成功すること" do
        get user_books_path(user)
        post user_books_path(user), params: { new_book: FactoryBot.attributes_for(:test_book) } #修正予定
        follow_redirect!
        expect(response.status).to eq 200
      end
    end
  end
end
