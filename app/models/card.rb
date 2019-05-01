# frozen_string_literal: true

class Card < ApplicationRecord
  has_many :include_card
  has_many :decks, through: :include_card
end
