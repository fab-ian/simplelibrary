# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserDecorator do
  let(:user) { build_stubbed :user, first_name: 'Igor', last_name: 'Wspanialy' }

  it 'returns phrase Igor Wspanialy' do
    expect(user.decorate.full_name).to eq('Igor Wspanialy')
  end
end
