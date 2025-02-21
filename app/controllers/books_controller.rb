class BooksController < ApplicationController
  def index
    
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book)
    else
      # まだわかんない
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end




  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :id)
  end

end
