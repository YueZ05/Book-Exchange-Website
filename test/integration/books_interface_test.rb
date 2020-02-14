require 'test_helper'

class BooksInterfaceTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
  end
  test "book interface" do log_in_as(@user)
    get root_path
    assert_select 'div.pagination'

    assert_no_difference 'Book.count' do
      post books_path, params: { book: { content: "" } }
    end
    assert_select 'div#error_explanation'
  # submission
    content = "This book really ties the room together"
    assert_difference 'Book.count', 1 do
      post books_path, params: { book: { content: content } }
    end
    assert_redirected_to root_url follow_redirect!
    assert_match content, response.body # delete book
    assert_select 'a', text: 'delete'
    first_book = @user.books.paginate(page: 1).first
    assert_difference 'Book.count', -1 do
      delete book_path(first_book)
    end
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end

  test "book sidebar count" do
    log_in_as(@user)
    get root_path
    assert_match "#{FILL_IN} books", response.body #no book
    other_user = users(:malory)
    log_in_as(other_user)
    get root_path
    assert_match "0 books", response.body
    other_user.books.create!(title: "A book")
    get root_path
    assert_match FILL_IN, response.body
  end

end
