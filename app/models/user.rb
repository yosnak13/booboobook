class User < ApplicationRecord
  has_many :characters, dependent: :destroy
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  with_options presence: true do
    validates :name, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :email
    validates :password
  end

  def active_for_authentication?
    super && (self.is_deleted == false )
  end
end
