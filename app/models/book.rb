# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true

  enum status: { available: 0, loaned: 1 }
end
