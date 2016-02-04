class BookController < ApplicationController
  scope :find_by_id, ->(id) { where("id = ?", id) }
  before_save :redirect_to_root_path

  def redirect_to_root_path
    redirect_to root_path
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find_by_id(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(params[:book].permit(:title, :author))
    book.save
    redirect_to root_path
  end

  def edit
    @book = Book.find_by_id(params[:id])
  end

  def update
    book = Book.find_by_id(params[:id])
    book.update(params[:book].permit(:title, :author))
    redirect_to root_path
  end

  def destroy
    book = Book.find_by_id(params[:id])
    book.destroy
    redirect_to root_path
  end
end
