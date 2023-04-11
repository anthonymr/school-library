class Rental
  attr_accessor :date
  attr_reader :book, :person

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
end
