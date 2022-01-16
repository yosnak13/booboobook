require 'rails_helper'

RSpec.describe "StudyTimes", type: :request do
  describe "学習時間を投稿するとき" do
    let(:user) { create(:user) }
    let(:book) { create(:test_book) }
    let(:study_time) { create(:study_time, book: book) }
    let(:study_time_params) { attributes_for(:study_time) }

    context "入力値が正しいとき" do
      it "投稿できるとき" do
        get study_times_user_path(user)
        post study_times_user_path(user), params: { study_time_posting: study_time_params }
        follow_redirect!
        expect(flash[:notice]) == "学習時間を記録しました！"
        expect(response.status).to eq 200
      end
    end

    context "入力値が不正のとき" do
      let(:invalid_study_time_params) { attributes_for(:study_time, study_time: "") }
      let(:invalid_study_date_params) { attributes_for(:study_time, study_date: "") }

      it "学習時間がnilで投稿できないとき" do
        get study_times_user_path(user)
        post study_times_user_path(user), params: { study_time_posting: invalid_study_time_params }
        redirect_to study_times_user_path(user)
        expect(flash[:danger]) == "入力をやり直してください"
        expect(response.status).to eq 302
      end

      it "学習日時がnilで投稿できないとき" do
        get study_times_user_path(user)
        post study_times_user_path(user), params: { study_time_posting: invalid_study_date_params }
        redirect_to study_times_user_path(user)
        expect(flash[:danger]) == "入力をやり直してください"
        expect(response.status).to eq 302
      end
    end
  end
end
