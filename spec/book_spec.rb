require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  context 'when initialized' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    it 'has a title' do
      expect(book.title).to eq('The Hobbit')
    end

    it 'has an author' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end

    it 'has no rentals' do
      expect(book.rentals).to be_empty
    end
  end

  context 'when adding rentals' do
    book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    person = Person.new(19, name: 'Jhon')
    rental = Rental.new('2020-01-01', book, person)
    book.add_rental(rental)
    it 'has rentals' do
      expect(book.rentals).not_to be_empty
    end

    it 'has the correct rental' do
      expect(book.rentals[0]).to eq(rental)
    end
  end

  context 'when initialized from json' do
    book = Book.from_json('title' => 'The Hobbit', 'author' => 'J.R.R. Tolkien', 'id' => 1)
    it 'has a title' do
      expect(book.title).to eq('The Hobbit')
    end

    it 'has an author' do
      expect(book.author).to eq('J.R.R. Tolkien')
    end
  end
end