class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :is_teacher

  has_many :user_topics
  has_many :topics, through: :user_topics
  has_many :posts
  has_many :comments
end
