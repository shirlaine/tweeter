class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags
  accepts_nested_attributes_for :tags
  validates :body,
            presence: true,
            length: { maximum: 140 }

end
