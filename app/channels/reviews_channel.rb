class ReviewsChannel < ApplicationCable::Channel
  def subscribed
    book = Book.find(params[:book_id])
    # binding.pry
    stream_for book
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
