class Like < ApplicationRecord

  belongs_to :user
  belongs_to :post_image
  belongs_to :post_comment

  validates_uniqueness_of :post_comment_id, scope: :user_id
end
