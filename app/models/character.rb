class Character < ApplicationRecord
  belongs_to :user

  def create_users_pork
    @pork1 = Pork.find(1)
    @pork2 = Pork.find(2)
    @pork3 = Pork.find(3)

    @character = Character.new(first_pork)

    first_pork = {
      :name => @pork1.name,
      :character_type => 1,
      :level => 1,
      :exp => 0,
      :description => @pork1.description,
      :photo => @pork1.photo,
      :user_id => 1,
    }
  end
end
