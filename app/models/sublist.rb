class Sublist < ApplicationRecord
  belongs_to :list
  has_many :items, dependent: :destroy
  validates :name, presence: true
  validates :name, uniqueness: { scope: :list_id }
end
