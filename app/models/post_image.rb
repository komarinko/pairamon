class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
    validates :caption, presence: true, length: { minimum: 1, maximum: 30 }
    validates :image, presence: true
end
