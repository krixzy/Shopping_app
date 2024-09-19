class List < ApplicationRecord
    has_many :sublists
    belongs_to :user
    validates :name, presence: true
    validates :name, uniqueness: true
end
