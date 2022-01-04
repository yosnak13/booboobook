require 'rails_helper'

RSpec.describe Character, type: :model do
  context "初回登録にてキャラクターを登録するとき" do
    before do
      @character = FactoryBot.build(:character)
      # @character.photo = fixture_file_upload("/images/TestLandrace.png")
    end

    it "正しく登録できるとき" do
      expect(@character).to be_valid
    end
  end
end
