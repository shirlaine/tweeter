class Tag < ApplicationRecord

  has_many :tweet_tags, dependent: :destroy
  has_many :tweets, through: :tweet_tags

  # validates :name, presence: true, length: { maximum: 15 }

end
