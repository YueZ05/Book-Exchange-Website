json.extract! book, :id, :title, :author, :ISBN, :class_name, :user_id, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
