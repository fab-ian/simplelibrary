# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all

  def status
    h.content_tag(:span, object.status, class: text_class)
  end

  def loan_return_url(user)
    attributes = object.available? ? loan_url : return_url(user)

    h.content_tag(:a, attributes[:label], href: attributes[:path], class: "btn btn-sm #{attributes[:clazz]}")
  end

  private

  def text_class
    object.status == 'available' ? 'text-success' : 'text-secondary'
  end

  def loaned?(user)
    Rental.exists?(book: object, user: user, status: :loaned)
  end

  def loan_url
    {
      label: h.t('loan'),
      path: h.loan_book_path(object.id),
      clazz: 'btn-success'
    }
  end

  def return_url(user)
    {
      label: h.t('return'),
      path: h.return_book_path(object.id),
      clazz: loaned?(user) ? 'btn-secondary' : 'btn-secondary disabled'
    }
  end
end
