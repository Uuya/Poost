class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
