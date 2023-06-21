class PostImage < ApplicationRecord

   belongs_to :user
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :likes, dependent: :destroy

　validates :shop_name, presence: true
  validates :image, presence: true
  validates :content,presence:true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
