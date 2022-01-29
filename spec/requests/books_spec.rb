require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { create(:user) }
  let(:book) { create(:test_book) }

  describe "書籍登録" do
    context "入力値が正しいとき" do
      it "書籍の登録が成功すること" do
        get user_books_path(user)
        post user_books_path(user), params: { new_book: book }
        follow_redirect!
        expect(response.status).to eq 200
      end

      it "書籍の編集が成功すること" do
        get edit_user_book_path(user, book)
        patch user_book_path(user, book), params: { edit_book: book, memo: "3時間で読了" }
        follow_redirect!
        expect(flash[:notice]) == "書籍変更が完了しました"
        expect(response.status).to eq 200
      end

      it "書籍の削除が成功すること" do
        get user_book_path(user, book)
        delete user_book_path(user, book)
        follow_redirect!
        expect(response.status).to eq 200
      end
    end

    context "入力値が正しくないとき" do
      let(:invalid_book_params) { attributes_for(:book, name: "") }

      it "書籍登録が失敗すること" do
        get user_books_path(user)
        post user_books_path(user), params: { invalid_book_params: invalid_book_params }
        redirect_to user_books_path(user)
        expect(response.status).to eq 302
      end

      it "書籍編集が失敗すること" do
        get edit_user_book_path(user, book)
        patch user_book_path(user, book), params: {
          edit_book: invalid_book_params, book_name: ""
        }
        redirect_to edit_user_book_path(user, book)
        expect(response.status).to eq 302
      end
    end
  end
end
