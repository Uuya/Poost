class Favorite < ApplicationRecord
  validates :user_id, presence: true
  validates :post_id, presence: true
  belongs_to :post, counter_cache: :favs_count
  belongs_to :user
end
