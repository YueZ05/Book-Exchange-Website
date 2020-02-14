class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :author, presence: true
  validates :user_id, presence: true
  validates :for_sale, presence: true
  validates :ISBN, length: {minimum:13, maximum: 13 }
  validates :quantity, numericality:  { greater_than: 0}


  def self.filter_by(filter_term)
    if filter_term != "clear"
      return where("LOWER(condition) LIKE :filter_term ", filter_term: "#{filter_term}")
    else
      return Book
    end
  end


  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term OR LOWER(author) LIKE :search_term OR LOWER(ISBN) LIKE :search_term OR LOWER(class_name) LIKE :search_term", search_term: "%#{search_term}%")
  end

end
