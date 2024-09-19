class Sublist < ApplicationRecord
  belongs_to :list
  has_many :items
  validates :name, presence: true
  validates :name, uniqueness: true
end
