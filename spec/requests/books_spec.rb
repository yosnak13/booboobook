require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { create(:user) }

  describe "書籍登録" do
    context "入力値が正しいとき" do
      let(:book) { create(:test_book) }

      it "書籍の登録が成功すること" do
        get user_books_path(user)
        post user_books_path(user), params: { new_book: book }
        follow_redirect!
        expect(response.status).to eq 200
      end

      it "書籍の編集が成功すること" do
        pending
        #  ActionController::UrlGenerationError: No route matches {:action=>"edit", :controller=>"books"}, missing required keys: [:id, :user_id]
        get edit_user_book_path
        patch user_book_path(user), params: { new_book: FactoryBot.attributes_for(:test_book, name: "プログラミング上級") }
        follow_redirect!
        expect(response.status).to eq 200
      end

      it "書籍の削除が成功すること" do
      end
    end
  end
end
