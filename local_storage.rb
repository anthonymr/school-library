require 'json'

class LocalStorage
  class << self
    attr_accessor :book_file, :person_file, :rental_file

    def save_data(app)
      save_to_file(book_file, array_to_hash(app.books))
      save_to_file(person_file, array_to_hash(app.people))
      save_to_file(rental_file, array_to_hash(app.rentals))
    end

    def load_data(app)
      app.books = load_from_file(book_file).map { |item| Book.from_json(item) }

      load_from_file(person_file).each do |item|
        app.people << if item['type'] == 'student'
                        Student.from_json(item)
                      else
                        Teacher.from_json(item)
                      end
      end

      app.rentals = load_from_file(rental_file).map do |item|
        Rental.from_json(item, books: app.books, people: app.people)
      end
    end

    def save_to_file(filename, data)
      File.write(filename, JSON.generate(data))
    end

    def load_from_file(filename)
      return [] unless File.exist?(filename) && !File.zero?(filename)

      JSON.parse(File.read(filename))
    end

    def array_to_hash(array)
      array.map(&:to_hash)
    end
  end
end
