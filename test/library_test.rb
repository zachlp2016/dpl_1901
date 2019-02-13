require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './test/test_helper'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @dpl = Library.new
  end

  def test_library_class_exists
    assert_instance_of Library, @dpl
  end

  def test_library_starts_with_no_books
    assert_equal [], @dpl.books
  end

  def test_library_can_add_books_to_collection
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal [@fifth_season, @mockingbird, @kingdoms], @dpl.books
  end

  def test_library_can_see_if_book_is_in_collection
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_library_has_card_catalogue_and_can_sort_by_authors_last_name
    skip
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    @dpl.add_to_collection(@fifth_season)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal @fifth_season, @kingdoms, @harper_lee, @dpl.card_catalogue
  end
end
