require 'rails_helper'

RSpec.describe "StudyTimes", type: :request do
  describe "GET /study_times" do
    it "works! (now write some real specs)" do
      get study_times_path
      expect(response).to have_http_status(200)
    end
  end
end
