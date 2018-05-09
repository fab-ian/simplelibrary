# frozen_string_literal: true

class Rental < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :status, presence: true

  enum status: { loaned: 0, returned: 1 }
end
