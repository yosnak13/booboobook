class FirstRegistration
  include ActiveModel::Model

  attr_accessor :name, :character_type, :level, :exp, :description, :photo, :user_id,
                :book_name, :isbn, :status, :total_read_time, :memo

  with_options presence: true do
    validates :name,            format: {with: /\A[ァ-ヶー－]+\z/}
    validates :character_type,  numericality: true
    validates :level,           numericality: true
    validates :exp,             numericality: true
    validates :description,     format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :book_name
    validates :status,          numericality: true
    validates :memo
  end

  def save
    Character.create(name: name, character_type: character_type, level: level,
      exp: exp, description: description,
      photo: ActiveStorage::Blob.create_after_upload!(io: File.open('./db/fixtures/Landrace.png'), filename: 'Landrace.png'),
      user_id: user_id
    )
    Book.create(book_name: book_name, isbn: isbn, status: status, memo: memo, user_id: user_id)
  end
end
