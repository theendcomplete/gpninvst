module Scalars
  class FileType < Scalars::BaseScalar
    def self.coerce_input(value, _context)
      return nil if value.nil?

      ActionDispatch::Http::UploadedFile.new(
        filename: value.original_filename,
        type: value.content_type,
        head: value.headers,
        tempfile: value.tempfile
      )
    end

    def self.coerce_result(value, _context)
      value
    end
  end
end
