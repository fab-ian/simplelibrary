# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all

  def status
    h.content_tag(:span, object.status, class: text_class)
  end

  private

  def text_class
    object.status == 'available' ? 'text-success' : 'text-secondary'
  end
end
