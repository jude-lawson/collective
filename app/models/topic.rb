class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :user_topics
  has_many :users, through: :user_topics
  has_many :posts
end