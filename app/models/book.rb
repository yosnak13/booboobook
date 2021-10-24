class Book < ApplicationRecord
  belongs_to :user
  has_many :study_time, dependent: :destroy
  validates :book_name, presence: true
  validates :status, presence: true
  enum status:{ 未読: 0, 読書中: 1, 読了: 2 }

  def total_read_time_sec #秒数換算してTimeオブジェクトを返すメソッド
    self.total_read_time *= 60
    self.total_read_time = Time.at(self.total_read_time)
  end
end
