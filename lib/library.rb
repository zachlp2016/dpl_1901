class Library

  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(book_name)

    @books.flatten.uniq.any? do |book|
      book.title == book_name
    end
  end

  def card_catalogue
    catalogue = []
    catalogue = @books.flatten.uniq.each do |book|
      catalogue << book
    end
    by_last_name = catalogue.sort_by do |book|
      book.author_last_name
    end
    return by_last_name
  end
end
