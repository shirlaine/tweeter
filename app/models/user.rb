class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates :username, presence: true, uniqueness: true, length: { in: 3..15 }, format: { with: /\A[a-zA-Z0-9]{3,15}\z/, message: 'only allows letters and numbers' }
  validates :fullname, presence: true, length: { in: 3..15 }

  validates :password, presence: true, length: { minimum: 6 }

  has_many :tweets, dependent: :destroy

  has_many :relationships, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :relationships

end

