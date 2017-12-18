require 'google_books_barcode_reader/version'
require 'google_books_barcode_reader/barcode'
require 'base64'

module GoogleBooksBarcodeReader
  def initialize(term)
    @term = term
  end

  def search_by_isbn
    GoogleBooks.search("isbn: #{scan_barcode}")
  end

  def scan_barcode
    valid_isbn_string(isbn_from_image)
  end

  def isbn_from_image
    Barcode.scan(source_image)
  end

  def source_image
    create_jpg_image
    File.expand_path(path_to_image, File.dirname(__FILE__))
  end

  def create_jpg_image
    File.open(path_to_image, 'wb') do |f|
      f.write decode_base64_image(@term)
    end
  end

  def decode_base64_image(data)
    base64_string = 'data:image/jpeg;base64,'
    Base64.decode64(data[base64_string.length..-1]) if data
  end

  def path_to_image
    "#{Rails.root}/public/isbn.jpg"
  end

  def valid_isbn_string
    get_isbn_from_string = ISBN.from_string(@term)
    get_isbn_from_string if ISBN.valid?(get_isbn_from_string)
  end

  def clear_tmp_image
    File.delete(path_to_image)
  end
end
