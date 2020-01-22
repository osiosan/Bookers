class BooksController < ApplicationController
  def index
  	@books = Book.all.order(created_at: :desc)
    @book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
  	   flash[:notice]="successfully create!"
  	   redirect_to book_path(@book.id)
    else
      @books = Book.all.order(created_at: :desc)
       render :index
    end
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  		 redirect_to book_path(@book.id)
       flash[:notice] = "successfully edit!"
    else
      render :edit
    end
  end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice]="successfully delete!"
  	redirect_to books_path
  end

  def top
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end