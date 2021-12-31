require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーサインアップ' do
    context '入力する' do
      it '入力値が正常なとき' do
        new_user = User.new(
          name: '田中 太郎',
          email: 'taro.tanaka@example.com',
          password: 'Adf567',
          encrypted_password: 'Adf567'
        )
        expect(new_user).to be_valid
        new_user.save

        first_user = User.find(1)
        expect(first_user.name).to eq('田中 太郎')
        expect(first_user.email).to eq('taro.tanaka@example.com')
      end
    end
  end
end
