class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_many :tags, through: :tweet_tags, dependent: :destroy
  accepts_nested_attributes_for :tags, reject_if: ->(attributes) { attributes['name'].blank? }
  validates :body,
            presence: true,
            length: { maximum: 140 }

end
