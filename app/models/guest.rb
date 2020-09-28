class Guest < ApplicationRecord
    has_many :rooms
    has_many :rooms, through: :reservations
end
