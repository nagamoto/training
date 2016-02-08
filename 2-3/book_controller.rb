class BookController < ApplicationController
  before_action :set_book, only: [:show, :edit ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if (book.save)
      redirect_to root_path
      exit
    end
    @notice = "保存に失敗しました。"
    redirect_to new_book_path
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to root_path
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to root_path
  end

  private

    def set_book
      raise if params[:id].blank
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author)
    end

end
