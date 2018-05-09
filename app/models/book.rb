# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :rentals

  validates :title, presence: true

  enum status: { available: 0, loaned: 1 }
end
