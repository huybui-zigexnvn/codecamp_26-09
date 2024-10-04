class ReviewsController < ApplicationController
  def create
    user = User.find_or_create_by_cookie(cookies[:uid]) 
    @book = Book.find(params[:book_id])
    @review = @book.reviews.build(review_params)
    @review.user = user
    
    if @review.save
      # Broadcast the new review using Action Cable
      ReviewsChannel.broadcast_to(@book, @review)
      respond_to do |format|
        format.html { redirect_to @book, notice: 'Review was successfully created.' }
        format.js
      end
    else
      render 'books/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
