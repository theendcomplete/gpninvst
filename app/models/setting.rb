class Setting < ApplicationRecord
  has_many :setting_diffs

  validates :key, uniqueness: true

  def self.get(keys:)
    Setting.where(key: keys).map do |v|
      case v.datatype
      when 'number'
        v.value = v.value.to_i
      when 'string'
        v.value = v.value.to_s
      end
      [v.key.to_sym, v.value]
    end.to_h
  end
end
