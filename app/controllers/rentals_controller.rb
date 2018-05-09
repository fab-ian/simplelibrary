# frozen_string_literal: true

class RentalsController < ApplicationController
  def index
    @rentals = Rental.includes(:book, :user).order(created_at: :desc)
  end
end
