class User < ApplicationRecord
  validates_presence_of :first_name, require: true
  validates_presence_of :last_name, require: true
  validates_presence_of :email, require: true
  validates_uniqueness_of :email
  # validates_presence_of :password, require: true
  validates_presence_of :role

  enum role: [:student, :teacher]

  has_secure_password

  has_many :topic_contributions
  has_many :topics
  has_many :posts
  has_many :comments
end
