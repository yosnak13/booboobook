require 'rails_helper'

RSpec.describe "StudyTimes", type: :request do
  describe "学習時間を投稿するとき" do
    let(:user) { create(:user) }
    let(:book) { create(:test_book) }

    context "入力値が正しいとき" do
      let(:study_time) { create(:study_time, book: book) }
      let(:study_time_params) { attributes_for(:study_time) }

      it "投稿できるとき" do
        get study_times_user_path(user)
        post study_times_user_path(user), params: { study_time_posting: study_time_params }
        follow_redirect!
        redirect_to users_path(user)
        expect(flash[:notice]) == "学習時間を記録しました！"
      end
    end
  end
end
