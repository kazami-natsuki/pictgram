class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 15 }

  validates :email, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  validates :password, length: { in: 8..32 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_secure_password

  has_many :topics

  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
# 課題
  has_many :comments
  has_many  :comment_topics, through: :comments, source: 'topic'
end
