class StaticPagesController < ApplicationController
  def home

  end

  def sell
    if logged_in?
      @book  = current_user.books.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def signup
  end

  def buy


    if params[:sort] && params[:search] && params[:filter]
      @search_term = params[:search]
      @filter_term = params[:filter]
      if(params[:sort]=="price_asc")
        @books = Book.filter_by(@filter_term).search_by(@search_term).order(:price).paginate(page: params[:page])
      elsif(params[:sort]=="price_desc")
        @books = Book.filter_by(@filter_term).search_by(@search_term).order(price: :desc).paginate(page: params[:page])
      else
        @books = Book.filter_by(@filter_term).search_by(@search_term).paginate(page: params[:page])
      end
    elsif params[:sort] && params[:search]
      @search_term = params[:search]
      if(params[:sort]=="price_asc")
        @books = Book.search_by(@search_term).order(:price).paginate(page: params[:page])
      elsif(params[:sort]=="price_desc")
        @books = Book.search_by(@search_term).order(price: :desc).paginate(page: params[:page])
      else
        @books = Book.search_by(@search_term).paginate(page: params[:page])
      end
    elsif params[:search] && params[:filter]
      @filter_term = params[:filter]
      @search_term = params[:search]
      @books = Book.filter_by(@filter_term).search_by(@search_term).paginate(page: params[:page])
    elsif params[:sort] && params[:filter]
      @filter_term = params[:filter]
      if(params[:sort]=="price_asc")
        @books = Book.filter_by(@filter_term).order(:price).paginate(page: params[:page])
      else
        @books = Book.filter_by(@filter_term).order(price: :desc).paginate(page: params[:page])
      end
    elsif params[:filter]
      @filter_term = params[:filter]
      @books = Book.filter_by(@filter_term).paginate(page: params[:page])
    elsif params[:sort]
      if(params[:sort]=="price_asc")
        @books = Book.order(:price).paginate(page: params[:page])
      elsif(params[:sort]=="price_desc")
        @books = Book.order(price: :desc).paginate(page: params[:page])
      else
        @books = Book.paginate(page: params[:page])
      end
    elsif params[:search]
      @search_term = params[:search]
      @books = Book.paginate(page: params[:page]).search_by(@search_term).paginate(page: params[:page])
    else
      @books = Book.paginate(page: params[:page])
    end



  end
end
