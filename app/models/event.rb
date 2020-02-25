class Event < ApplicationRecord
  enum event_type: { call: 0, meeting: 1, event: 2 }
  enum language: { ru: 0, en: 1 }
  enum status_code: { draft: 0, upcoming: 1, expired: 2 }

  has_many :event_organizers, dependent: :destroy
  has_many :organizers, through: :event_organizers, source: :user
  has_many :event_participants, dependent: :destroy
  has_many :participants, through: :event_participants, source: :investor
  has_many :event_tags
  has_many :tags, through: :event_tags
  belongs_to :address
  accepts_nested_attributes_for :address

  has_many_attached :attachments

  scope :accessible, lambda { |user|
    where(
      event_organizers: { user: user }
    )
      .left_outer_joins(:event_organizers)
  }

  serialize :timezones, Array

  validates :name, presence: true

  with_options if: :call? do
    with_options unless: :draft? do
      validates :start_at, presence: true
      validates :finish_at, presence: true
      validates :event_link, presence: true
      validates :participants, length: { minimum: 1 }
      validates :organizers, length: { minimum: 1 }
    end
  end

  with_options if: :meeting? do
    with_options unless: :draft? do
      validates :start_at, presence: true
      validates :finish_at, presence: true
      validates :address, presence: true
      validates :participants, length: { minimum: 1 }
      validates :organizers, length: { minimum: 1 }
    end
  end

  with_options if: :event? do
    with_options unless: :draft? do
      validates :description, presence: true
      validates :participants, length: { minimum: 1 }
      validates :organizers, length: { minimum: 1 }
    end
  end

  def participants_confirmed_count
    event_participants.where(confirmed: true).count
  end
end
