class Book
  attr_accessor :title, :author, :ISBN, :class_name, :user_id, :price

  def initialize(attributes = {})
    @title  = attributes[:title]
    @author = attributes[:author]
    @ISBN  = attributes[:ISBN]
    @class_name = attributes[:class_name]
    @user_id  = attributes[:user_id]
    @price = attributes[:price]
  end

end
