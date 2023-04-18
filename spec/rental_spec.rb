require 'json'

require_relative '../rental'
require_relative '../book'
require_relative '../person'

describe Rental do
  book = Book.new('The Hobbit', 'J.R.R. Tolkien', 1)
  person = Person.new(18, name: 'John Doe', parent_permission: true, id: 1)

  it 'rental should initalize successfully' do
    rental = Rental.new('2020-07-24', book, person)
    expect(rental).to be_a(Rental)
  end

  it '[from_json] should return a rental object' do
    rental = Rental.from_json(
      JSON.parse('{"book_id":1,"person_id":1,"date":"2020-07-24"}'),
      books: [book],
      people: [person]
    )
    expect(rental).to be_a(Rental)
  end

  rental = nil

  before :each do
    rental = Rental.new('2020-07-24', book, person)
  end

  it '[to_hash] should return a hash' do
    rental_hash = rental.to_hash

    expect(rental_hash).to be_a(Hash)
  end

  it '[to_hash] should return a hash with the correct keys' do
    rental_hash = rental.to_hash

    expect(rental_hash.keys).to match_array(%i[date person_id book_id])
  end
end
