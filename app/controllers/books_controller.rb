class BooksController < ApplicationController

  def index
    # @books = Unirest.get("http://localhost:3000/books.json").body
    @books = Book.all
  end

  def show
    # @book = Unirest.get("http://localhost:3000/books/#{params[:id]}.json").body
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    # @book = Unirest.post("http://localhost:3000/books.json", headers: {"Accept" => "application/json"}, parameters: {title: params[:title], author_first_name: params[:author_first_name], author_last_name: params[:author_last_name], page_count: params[:page_count], rating: params[:rating], genre: params[:genre]}).body
    @book = Book.create({title: params[:title], author_first_name: params[:author_first_name], author_last_name: params[:author_last_name], page_count: params[:page_count], rating: params[:rating], genre: params[:genre]})
    redirect_to "/books/#{@book.id}"
  end

  def edit
    # @book = Unirest.get("http://localhost:3000/books/#{params[:id]}.json").body 
    @book = Book.find(params[:id])
  end

  def update
    # @book = Unirest.patch("http://localhost:3000/books/#{params[:id]}.json", headers: {"Accept" => "application/json"}, parameters: {title: params[:title], author_first_name: params[:author_first_name], author_last_name: params[:author_last_name], page_count: params[:page_count], rating: params[:rating], genre: params[:genre]}).body
    @book = Book.find(params[:id])
    @book.update(title: params[:title], author_first_name: params[:author_first_name], author_last_name: params[:author_last_name], page_count: params[:page_count], rating: params[:rating], genre: params[:genre])
    redirect_to "/books/#{@book.id}"
  end

  def destroy
    # Unirest.delete("http://localhost:3000/books/#{params[:id]}.json", headers: {"Accept" => "application/json"}).body
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to "/books"
  end

end
