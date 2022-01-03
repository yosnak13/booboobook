require 'rails_helper'

RSpec.describe Character, type: :model do
  context "初回登録にてキャラクターを登録するとき" do
    it "正しく登録できるとき" do
      new_character = FactoryBot.create(:character)
      expect(new_character).to be_valid
    end
  end
end
