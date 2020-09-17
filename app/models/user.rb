class User < ApplicationRecord
  validates :name, presence: true
  # 課題
  validates :name, length: { maximum: 15 }

  validates :email, presence: true
  # 課題
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  # 課題
  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }


  has_secure_password
end
