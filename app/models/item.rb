class Item < ApplicationRecord
  belongs_to :sublist
  validates :name, presence: true
  validates :name, uniqueness: { scope: :sublist_id }
end
