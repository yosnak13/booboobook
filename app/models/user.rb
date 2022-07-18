class User < ApplicationRecord
  has_many :characters, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :study_times, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  with_options presence: true do
    validates :name
    validates :email
  end

  def active_for_authentication?
    super && (self.is_deleted == false )
  end
end
