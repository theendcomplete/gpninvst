class EventTag < ApplicationRecord
  belongs_to :event
  belongs_to :tag

  validates :event, presence: true
  validates :tag, presence: true
end
