class Author

  attr_reader :first_name,
              :last_name,
              :books

  def initialize(attributes)
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @books = []
  end

  def add_book(book_title, book_date)
    new_book = Book.new({author_first_name: @first_name, author_last_name: @last_name, publication_date: book_date, title: book_title})
    @books << new_book
  end
end
