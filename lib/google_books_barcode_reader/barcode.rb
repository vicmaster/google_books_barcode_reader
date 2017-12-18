require 'zbar'

module GoogleBooksBarcodeReader
  class Barcode
    def initialize(term)
      @term = term
    end

    def scan
      barcode = ZBar::Image.from_jpeg(File.read(@term)).process
      return barcode.first.data unless barcode.empty?
    end
  end
end
