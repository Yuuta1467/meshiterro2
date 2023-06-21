class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post_image
  has_many :likes, dependent: :destroy

  validates :comment, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
