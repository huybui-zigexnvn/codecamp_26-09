import { createConsumer } from "@rails/actioncable"

const consumer = createConsumer()

function subscribeToBookReviews(bookId) {
  consumer.subscriptions.create({ channel: "ReviewsChannel", book_id: bookId }, {
    received(data) {
      // Update your page with the new review
      console.log("New review:", data)
      const reviewsList = document.getElementById("reviews-list")
      if (reviewsList) {
        reviewsList.insertAdjacentHTML('beforeend', `<p>${data.content}</p>`)
      }
    }
  })
}

window.subscribeToBookReviews = subscribeToBookReviews
