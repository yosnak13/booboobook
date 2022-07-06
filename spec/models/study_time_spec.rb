require 'rails_helper'

RSpec.describe StudyTime, type: :model do
  describe "読書時間を登録するとき" do
    let(:post_study_time) { create(:study_time) }
    it "入力値が正しいとき" do
      expect(post_study_time).to be_valid
      expect(post_study_time.save).to be_truthy
    end

    it "入力値が誤りの場合" do
      wrong_study_time = build(:study_time, study_time: "")
      expect(wrong_study_time).not_to be_valid
      expect(wrong_study_time.save).to be_falsey
    end
  end
end
