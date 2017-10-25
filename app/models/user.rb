class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]{3,15}\z/, message: 'only allows letters and numbers' }
  validates :fullname, presence: true, length: { in: 3..20 }

  has_many :tweets, dependent: :destroy

end
