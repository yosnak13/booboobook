class Book < ApplicationRecord
  belongs_to :user
  has_many :study_times, dependent: :destroy

  validates :book_name, presence: true
  validates :status, presence: true

  enum status:{ 未読: 0, 読書中: 1, 中断中: 2, 読了: 3 }

  def total_read_time_sec #秒数換算してTimeオブジェクトを返すメソッド
    self.total_read_time *= 60
    self.total_read_time = Time.at(self.total_read_time)
  end

  def study_times_new
    study_times.new
  end
end
