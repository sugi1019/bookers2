class BooksController < ApplicationController
  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])    # 本の情報を取得
    @user = @books.user                 # 本に関連するユーザーを取得
    @book = Book.new                    # 新しい本オブジェクトを作成
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
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end




  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :id)
  end

end
