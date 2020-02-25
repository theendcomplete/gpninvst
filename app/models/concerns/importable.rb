module Importable
  extend ActiveSupport::Concern

  def create_or_update_from_csv(file, model = self, csv_fields_mapping = self::CSV_FIELDS_MAPPING, csv_fields_refs_creators = self::CSV_FIELDS_REFS_CREATORS)
    default_mapping_map = ->(value) { value&.strip }
    invalid_rows = []
    model.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        create_attrs = {}
        update_attrs = {}
        row_hash = row.to_hash

        row_hash.each do |key, value|
          mapping = csv_fields_mapping[key]
          next if mapping.nil?

          attribute = {
            mapping[:column] => (mapping[:map] || default_mapping_map).call(value)
          }
          if mapping[:primary]
            create_attrs.merge!(attribute)
          else
            update_attrs.merge!(attribute)
          end
        end

        item = model.find_or_initialize_by(create_attrs)
        item.update!(update_attrs)
        create_references(row_hash, item, csv_fields_refs_creators)
      rescue StandardError => e
        invalid_rows << { row: row, ex: e }
      end
    end
    {
      invalid_rows: invalid_rows
    }
  end

  def create_references(row_hash, object, csv_fields_refs_creators)
    row_hash.each do |key, value|
      creator = csv_fields_refs_creators[key]
      next if creator.nil? || value.blank?

      creator[:create].call(object, value)
    end
  end
end
