# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RentalsController, type: :controller do
  render_views

  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end
  end
end
