class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def self.from_json(data)
    new(data['title'], data['author'], data['id'])
  end

  def initialize(title, author, id = nil)
    @title = title
    @author = author
    @rentals = []
    @id = id || rand(1..1000)
  end

  def add_rental(rental)
    @rentals << rental
    rental.book = self
  end

  def to_hash
    {
      id: @id,
      title: @title,
      author: @author
    }
  end
end
