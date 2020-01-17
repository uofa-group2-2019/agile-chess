class User < ApplicationRecord
  has_many :games
  has_many :pieces
  validates :name, presence: true
end
