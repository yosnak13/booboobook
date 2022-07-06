class StudyTime < ApplicationRecord
  belongs_to :book
  belongs_to :user

  with_options presence: true do
    validates :study_time
    validates :study_date
  end

  def save_study_time(study_time, study_time_params)
    study_time.study_time = study_time_params[:study_time]
    study_time.study_date = study_time_params[:study_date]
    study_time.book_id = study_time_params[:book_id]
    study_time.user_id = study_time_params[:user_id]
    save
  end
end
