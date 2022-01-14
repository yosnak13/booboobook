require 'rails_helper'

RSpec.describe "StudyTimes", type: :request do
  describe "学習時間を投稿するとき" do
    let(:user) { create(:user) }
    let(:study_time) { create(:study_time)}

    context "入力値が正しいとき" do
      it "投稿できるとき" do
        post study_times_user_path(user), params:  study_time
        expect(response).to have_http_status(200)
      end
    end
  end
end
