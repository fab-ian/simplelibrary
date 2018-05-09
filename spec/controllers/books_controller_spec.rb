# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  render_views

  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:book_attributes) { attributes_for(:book) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, params: { id: book.id }
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #create' do
    it 'returns http redirect' do
      post :create, params: { book: book_attributes }
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #update' do
    it 'returns http redirect' do
      patch :update, params: { id: book.id, book: { title: 'Super new title' } }
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #destroy' do
    it 'returns http redirect' do
      delete :destroy, params: { id: book.id }
      expect(response).to have_http_status(302)
    end
  end
end
