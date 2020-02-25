class Tag < ApplicationRecord
  has_many :event_tags
  has_many :events, through: :event_tags

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  def self.find_or_create_by_name(*args)
    options = args.extract_options!
    options[:name] = args[0] if args[0].is_a?(String)
    case_sensitive = options.delete(:case_sensitive)
    conditions = case_sensitive ? ['name = ?', options[:name]] :
                     ['UPPER(name) = ?', options[:name].upcase]
    first(conditions: conditions) || create(options)
  end
end
