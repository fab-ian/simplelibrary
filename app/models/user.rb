# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rentals

  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    user ||= User.create(
      first_name: data['first_name'],
      last_name: data['last_name'],
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end
end
