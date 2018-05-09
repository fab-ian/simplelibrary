# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rental, type: :model do
  it { should belong_to(:book) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:status) }
end
