class Rental
  attr_accessor :date
  attr_reader :book, :person

  def self.from_json(data, books: [], people: [])
    book = books.find { |b| b.id == data['book_id'] }
    person = people.find { |p| p.id == data['person_id'] }
    Rental.new(data['date'], book, person)
  end

  def initialize(date, book, person)
    @date = date
    self.book = book
    self.person = person
  end

  def book=(book)
    @book = book
    book.add_rental(self) unless book.rentals.include?(self)
  end

  def person=(person)
    @person = person
    person.add_rental(self) unless person.rentals.include?(self)
  end

  def to_hash
    {
      date: @date,
      book_id: @book.id,
      person_id: @person.id
    }
  end
end
