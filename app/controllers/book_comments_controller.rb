class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    book = BookComment.find(params[:book_id])
    book.destroy
    redirect_back(fallback_location: book_path(book.id))
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
