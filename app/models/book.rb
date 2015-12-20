class Book

  attr_accessor :title, :author_first_name, :author_last_name, :page_count, :rating, :genre, :id

  def initialize(hash)
    @title = hash["title"]
    @author_first_name = hash["author_first_name"]
    @author_last_name = hash["author_last_name"]
    @page_count = hash["page_count"]
    @rating = hash["rating"]
    @genre = hash["genre"]
    @id = hash["id"]
  end

  def self.find(id)
    book_hash = Unirest.get("http://localhost:3000/books/#{id}.json").body
    @book = Book.new(book_hash)
    puts "stuff"
    p @book
    return @book
  end

  def self.all
    books = []
    books_hash = Unirest.get("http://localhost:3000/books.json").body
    books_hash.each do |book|
      books << Book.new(book)
    end
    return books
  end

  def destroy
    Unirest.delete("http://localhost:3000/books/#{id}.json").body
  end

  def self.create(attributes)
    book_hash = Unirest.post("http://localhost:3000/books.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Book.new(book_hash)
  end

  def update(attributes)
    book_hash = Unirest.patch("http://localhost:3000/books/#{id}.json", headers: {"Accept" => "application/json"}, parameters: attributes).body
    Book.new(book_hash)
  end

end