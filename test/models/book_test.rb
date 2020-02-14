require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
    @user1 = users(:michael)
    #@book = Book.new(title:"title1", author:"jane doe", ISBN: "1234567891011", class_name:"cse3901", user_id: @user1.id, price: 12.44,
                     #condition: "Good", description:"this is a book.", for_sale: true, quantity:1)#
    @book = @user1.books.build(title:"title1", author:"jane doe", ISBN: "1234567891011", class_name:"cse3901", price: 12.44,
                             condition: "Good", description:"this is a book.", for_sale: true, quantity:1)
  end

  #validating presence#
  test "should be valid" do
    assert @book.valid?
    #assert @book1.valid?#
  end

  test "title should be present" do
    @book.title = "     "
    assert_not @book.valid?
 end

  test "author should be present" do
    @book.author = ""
    assert_not @book.valid?
  end

  test "user id should be present" do
    @book.user_id = " "
    assert_not @book.valid?
  end

  test "for_sale should be present" do
    @book.for_sale= nil
    assert_not @book.valid?
  end


  #length validataion
  test "ISBN should be 13 characters" do
    @book.ISBN = "12345678901111"
    assert_not @book.valid?
  end

  test "ISBN should be only 13 characters" do
    @book.ISBN = "123456789011"
    assert_not @book.valid?
  end

  #format validation
  test "quantity should be greater than zero" do
    @book.quantity = -1
    assert_not @book.valid?
  end

end
