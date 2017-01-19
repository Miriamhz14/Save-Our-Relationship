class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 1600}
  default_scope -> {order(created_at: :desc) }  #organizes from newest to oldest
end
