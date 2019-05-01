class Deck < ApplicationRecord
	belongs_to :user
	has_many :include_card
	has_many :cards, through: :include_card
end
