class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }, format: { with: /\A[a-zA-Z0-9]{3,15}\z/, message: 'only allows letters and numbers' }
  validates :fullname, presence: true, length: { in: 3..15 }

  validates :password, presence: true, length: { minimum: 6 }

  has_many :tweets, dependent: :destroy

  # avatar
  mount_uploader :avatar, AvatarUploader

  # creating assocation name.leaders
  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :relationships

  # creating association name.followers
  has_many :reverse_relationships, foreign_key: :leader_id, class_name: 'Relationship', dependent: :destroy
  has_many :followers, through: :reverse_relationships

  def following?(leader)
    leaders.include?(leader)
  end

  def follow!(leader)
    leaders << leader if leader != self && !following?(leader)
  end

  def unfollow(leader)
    leaders.destroy(leader)
  end

end
