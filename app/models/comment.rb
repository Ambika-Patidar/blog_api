class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable

  validates :body, :commentable_id, :commentable_type, presence: true
end
