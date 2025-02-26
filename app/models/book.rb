class Book < ApplicationRecord

  belongs_to :user
  has_many :favorites, dependent: :destroy

  validates :title, :body, presence: true
  validates :body, length: { maximum: 200 }


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
