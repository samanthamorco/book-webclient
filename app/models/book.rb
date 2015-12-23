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

  def self.all
    books = []
    books_hash = Unirest.get("#{ENV['API_BASE_URL']}/books.json", headers: {"X-User-Email": "test@gmail.com", "Authorization": "Token token=ABC123"}).body
    books_hash.each do |book|
      books << Book.new(book)
    end
    return books
  end

  def self.find(id)
    book_hash = Unirest.get("#{ENV['API_BASE_URL']}/books/#{id}.json", headers: {"X-User-Email": "test@gmail.com", "Authorization": "Token token=ABC123"}).body
    @book = Book.new(book_hash)
    return @book
  end

  def destroy
    Unirest.delete("#{ENV['API_BASE_URL']}/books/#{id}.json", headers: {"X-User-Email": "test@gmail.com", "Authorization": "Token token=ABC123"}).body
  end

  def self.create(attributes)
    book_hash = Unirest.post("#{ENV['API_BASE_URL']}/books.json", headers: {"Accept" => "application/json", "X-User-Email": "test@gmail.com", "Authorization": "Token token=ABC123"}, parameters: attributes).body
    Book.new(book_hash)
  end

  def update(attributes)
    book_hash = Unirest.patch("#{ENV['API_BASE_URL']}/books/#{id}.json", headers: {"Accept" => "application/json", "X-User-Email": "test@gmail.com", "Authorization": "Token token=ABC123"}, parameters: attributes).body
    Book.new(book_hash)
  end

end