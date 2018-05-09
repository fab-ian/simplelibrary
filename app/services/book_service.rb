# frozen_string_literal: true

class BookService
  class << self
    def call(status, book, user)
      send status, book, user
    end

    def loan(book, user)
      execute_transaction do
        book.loaned!
        Rental.create(book: book, user: user, status: :loaned)
      end
    end

    def return(book, user)
      execute_transaction do
        book.available!
        Rental.create(book: book, user: user, status: :returned)
      end
    end

    def execute_transaction
      ActiveRecord::Base.transaction do
        yield
      end
      nil
    rescue ActiveRecord::StatementInvalid => e
      e.message
    end
  end
end
