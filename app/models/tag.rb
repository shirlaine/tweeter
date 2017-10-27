class Tag < ApplicationRecord

  has_many :tweet_tags, dependent: :destroy
  has_and_belongs_to_many :tweets, join_table: :tweet_tags

  validates :name, presence: true, length: { maximum: 15 }

end
