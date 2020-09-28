class Guest < ApplicationRecord
    has_many :rooms
    has_many :rooms, through: :reservations
    has_secure_password
end
