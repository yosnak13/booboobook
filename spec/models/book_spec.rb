require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "書籍登録" do
    context "書籍を新たに登録するとき" do
      it "正しく登録できるとき" do
        new_book = FactoryBot.build(:test_book)
        # isbn不要でも登録可能
        isbn_blank_book = FactoryBot.build(:test_book, isbn: "")
        expect(new_book).to be_valid
        expect(new_book.save).to be_truthy
        expect(isbn_blank_book).to be_valid
        expect(isbn_blank_book.save).to be_truthy
      end

      it "正しく登録できないとき" do
        name_blank_book = FactoryBot.build(:test_book, book_name: "")
        expect(name_blank_book).not_to be_valid
        expect(name_blank_book.save).to be_falsey
      end
    end
  end

  describe "書籍編集" do
    it "編集するとき" do
      edit_book = FactoryBot.build(:test_book)
      edit_book.update(book_name: "Ruby on Rails その1", memo: "読書完了まであと少し")
      expect(edit_book.save).to be_truthy
    end

    it "削除するとき" do
      delete_book = FactoryBot.build(:test_book)
      delete_book.delete
      expect(delete_book).to be_truthy
    end
  end
end
