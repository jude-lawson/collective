class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :topic_contributions
  has_many :users, through: :topic_contributions
  belongs_to :user
  has_many :posts
end
