class User < ApplicationRecord
  has_many :orders
  validate :valid_email, on: :create
  validates :phone, numericality: true, length: {in: 9..12}
  validates :password, length: {in: 8..12}
  validate :valid_password

  private
    def valid_email
      if email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
        return true
      else
        errors.add(:email, "not a valid email")
        return false
      end
    end

    def valid_password
      if password =~ /^[A-Za-z0-9]+$/
        return true
      else
        errors.add(:password, "not a valid password")
        return false
      end
    end
end
