# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def full_name_with_logout
    "#{h.t('.logout')} (#{full_name})"
  end
end
