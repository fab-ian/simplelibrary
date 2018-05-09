# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :find_book, only: %i[edit show update destroy loan return]

  def index
    @books = Book.order(title: :asc).decorate
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params_book)

    if @book.save
      redirect_to books_path, notice: I18n.t('message_of_addition')
    else
      render :new
    end
  end

  def update
    if @book.update(params_book)
      redirect_to books_path, notice: I18n.t('message_of_modification')
    else
      render :edit
    end
  end

  def destroy
    message = @book.destroy ? 'message_of_deletion' : 'message_of_deletion_fail'
    redirect_to books_path, notice: I18n.t(message)
  end

  def loan
    change_status(:loan, I18n.t('message_of_loaning'))
  end

  def return
    change_status(:return, I18n.t('message_of_returning'))
  end

  private

  def params_book
    params.require(:book).permit(:title, :description)
  end

  def find_book
    @book = Book.find(params[:id]).decorate
  end

  def change_status(current_status, notice)
    message = BookService.call(current_status, @book, current_user)

    if message.nil?
      redirect_to books_path, notice: notice
    else
      redirect_to books_path, error: message
    end
  end
end
