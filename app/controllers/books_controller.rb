class BooksController < ApplicationController
  before_action :set_url_options, only: [:index, :show]

  def index
    @books = Book.all 
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find_by(id:params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    @book= Book.find_by(id:params[:id])
    if @book.update(book_params)
      redirect_to(@book)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @book= Book.find_by(id:params[:id])
    
  end

  def destroy
    @book= Book.find_by(id:params[:id])
    if @book.destroy
      redirect_to books_url, notice: 'Book was successfully destroyed.'
    end

  end

  private 
  def book_params
    params.require(:book).permit(:name, :title, :content,:image,:pdf)
  end
  def set_url_options
    ActiveStorage::Current.url_options = Rails.application.config.action_controller.default_url_options
  end
end
