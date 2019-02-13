require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './test/test_helper'
require './lib/book'
require './lib/author'


class AuthorTest < Minitest::Test

  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
  end

  def test_that_author_class_exists
    assert_instance_of Author, @nk_jemisin
  end

  def test_that_author_starts_with_no_books
    assert_equal [], @nk_jemisin.books
  end


# Ok I need to find a way to test this
  def test_author_can_add_book
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    assert_equal @fifth_season, @nk_jemisin.books
  end

  def test_author_can_add_another_book
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    assert_equal @fifth_season, @kingdoms, @nk_jemisin.books
  end
end

# > nk_jemisin.books
# # => [#<Book:0x007f98a9c6ace8 @author_first_name="N.K.", @author_last_name="Jemisin", @publication_date="2015", @title="The Fifth Season">]
#
# > nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
# #<Book:0x007f98a9c6ad48 @author_first_name="N.K.", @author_last_name="Jemisin", @publication_date="2010", @title="The Hundred Thousand Kingdoms">
#
# > nk_jemisin.books
# # => [
#       #<Book:0x007f98a9c6ace8 @author_first_name="N.K.", @author_last_name="Jemisin", @publication_date="2015", @title="The Fifth Season">,
#       #<Book:0x007f98a9c6ad48 @author_first_name="N.K.", @author_last_name="Jemisin", @publication_date="2010", @title="The Hundred Thousand Kingdoms">
#     ]
