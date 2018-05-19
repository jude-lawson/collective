class Post < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :body

  belongs_to :topic
  belongs_to :user
  has_many :comments
end