require 'rails_helper'

RSpec.describe Character, type: :model do
  describe "初回登録にてキャラクターを登録するとき" do
    before do
      @character = build(:character)
      # @character.photo = fixture_file_upload("/images/TestLandrace.png")
    end

    it "正しく登録できるとき" do
      expect(@character).to be_valid
    end
  end

  describe "経験値を得るとき" do
    context "経験値を加算するとき" do
      before do
        @character = build(:character)
      end

      it "入力値が正しいとき" do
        @character.exp += 30
        expect(@character).to be_valid
        expect(@character.save).to be_truthy
      end

      it "入力値が誤りのとき" do
        @character.exp = nil
        expect(@character).not_to be_valid
        expect(@character.save).to be_falsey
      end
    end
  end
end
