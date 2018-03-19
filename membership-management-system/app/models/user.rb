class User < ActiveRecord::Base
has_and_belongs_to_many :events
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_UIN_REGEX = /[\d]/
  validates :uin,   presence: true, length: { maximum: 50 },   format: { with: VALID_UIN_REGEX },   uniqueness: true
  has_secure_password
  #validates :password, presence: true, length: { minimum: 6 }
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
