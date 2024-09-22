class List < ApplicationRecord
    has_many :sublists, dependent: :destroy
    belongs_to :user
    validates :name, presence: true
    validates :name, uniqueness: { scope: :user_id }
end
