class Tweet < ApplicationRecord

  belongs_to :user
  has_many :tweet_tags, dependent: :destroy
  has_and_belongs_to_many :tags, join_table: :tweet_tags
  validates :body,
            presence: true,
            length: { maximum: 140 }

end
