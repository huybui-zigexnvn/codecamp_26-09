document.addEventListener("DOMContentLoaded", () => {
  const searchInput = document.getElementById('search-input');
  const bookList = document.getElementById('book-list');

  function debounce(func, wait) {
    let timeout;
    return function() {
      const context = this, args = arguments;
      clearTimeout(timeout);
      timeout = setTimeout(() => func.apply(context, args), wait);
    };
  }

  const handleSearch = debounce(function() {
    const query = searchInput.value;

    fetch(`/?q[title_cont]=${query}`, {
      headers: { 'Accept': 'text/html' }
    })
    .then(response => response.text())
    .then(html => {
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      const newBookList = doc.getElementById('book-list');
      bookList.innerHTML = newBookList.innerHTML;
    });
  }, 300);

  searchInput.addEventListener('input', handleSearch);
});