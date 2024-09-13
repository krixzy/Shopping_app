class List < ApplicationRecord
    has_many :sublists
    belongs_to :user
end
