# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BookDecorator do
  let(:book_available) { build_stubbed :book }
  let(:book_loaned) { build_stubbed :book, status: 'loaned' }

  it "returns 'text-success' class" do
    expect(book_available.decorate.status).to match(/text-success/)
  end

  it "returns 'text-secondary' class" do
    expect(book_loaned.decorate.status).to match(/text-secondary/)
  end
end
