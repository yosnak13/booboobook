require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "書籍登録" do
    context "書籍を新たに登録するとき" do
      it "正しく登録できるとき" do
        new_book = FactoryBot.build(:test_book)
        # isbn不要でも登録可能
        isbn_blank_book = FactoryBot.build(:test_book, isbn: "")
        expect(new_book).to be_valid
        expect(isbn_blank_book).to be_valid
      end

      it "正しく登録できないとき" do
        name_blank_book = FactoryBot.build(:test_book, book_name: "")
        expect(name_blank_book).not_to be_valid
      end
    end
  end
end
