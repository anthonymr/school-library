require 'json'

class LocalStorage
  book_file = ''
  person_file = ''
  rental_file = ''

  class << self
    attr_accessor :book_file, :person_file, :rental_file
    def save_data(app)
      save_to_file(book_file, array_to_hash(app.books))
      save_to_file(person_file, array_to_hash(app.people))
      save_to_file(rental_file, array_to_hash(app.rentals))
    end

    def load_data

    end

    def save_to_file(filename, data)
      File.open(filename, 'w') do |file|
        file.write(JSON.generate(data))
      end
    end

    def load_from_file(filename)
      return [] unless File.exist?(filename)
        
      JSON.parse(File.read(filename))
    end

    def array_to_hash(array)
      array.map { |item| item.to_hash }
    end
  end
end