class Note < ApplicationRecord
  belongs_to :user
  belongs_to :investor, optional: true

  validates :title, presence: true, length: { maximum: 48 }

  scope :accessible, lambda { |user|
    where(user: user)
  }

  def text_short
    text[0..42]
  end
end
