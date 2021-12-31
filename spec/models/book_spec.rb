require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "書籍登録" do
    context "登録" do
      it "正しく登録できる機能" do
        new_book = Book.new(
          isbn: "0000000000",
          book_name: "プログラムの本 その1",
          total_read_time: 0,
          status: 0,
          memo: "最初に登録して1時間よみます",
          user: "" #userを入力
        )
        expect(new_book).to be_valid
      end
    end
  end
end
