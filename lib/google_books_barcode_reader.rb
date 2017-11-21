require 'google_books_barcode_reader/version'
require 'google_books_barcode_reader/barcode'

module GoogleBooksBarcodeReader
  # Your code goes here...
  def scan_barcode
    Barcode.scan(picture)
  end

  def valid_isbn?(isbn)
    ISBN.valid?(isbn)
  end
end
