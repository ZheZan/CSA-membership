class Admin < ActiveRecord::Base
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_UIN_REGEX = /[\d]/
  #validates :uin,   presence: true, length: { maximum: 50 },   format: { with: VALID_UIN_REGEX },   uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def Admin.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
