require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーサインアップ' do
    context '入力する' do
      it '入力値が正常なとき' do
        new_user = FactoryBot.build(:test_user_tanaka)
        expect(new_user).to be_valid
        new_user.save
      end
    end
  end
end
