require 'zbar'

module GoogleBooksBarcodeReader
  class Barcode
    def scan(picture)
      barcode = ZBar::Image.from_jpeg(File.read(picture)).process
      return barcode.first.data unless barcode.empty?
    end
  end
end
