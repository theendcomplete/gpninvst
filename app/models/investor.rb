class Investor < ApplicationRecord
  extend Importable

  CSV_FIELDS_MAPPING = {
      'Email' => {
          column: :email,
          primary: true
      },
      'First Name' => {
          column: :first_name
      },
      'Last Name' => {
          column: :last_name
      },
      'Institution Title' => {
          column: :institution_title
      },
      'Institution Type' => {
          column: :institution_type_title
      },
      'Side' => {
          column: :side_title
      },
      'Asset Class' => {
          column: :asset_class_title
      },
      'Job Function' => {
          column: :job_function_title
      },
      'Phone' => {
          column: :phone
      },
      'Address' => {
          column: :address
      },
      'City' => {
          column: :city
      },
      'Country' => {
          column: :country
      },
      'Geographic Region' => {
          column: :geo_region
      },
      'Last Activity' => {
          column: :last_active_at
      },
      'Status' => {
          column: :status,
          map: lambda { |value|
            status_map = {
                'Active': 'active'
            }
            status_map[value&.to_sym]
          }
      }
  }.freeze
  CSV_FIELDS_REFS_CREATORS = {}.freeze

  has_many :notes, dependent: :destroy

  has_one :attrs, -> { readonly }, class_name: 'InvestorAttr'

  has_many :event_participants, dependent: :destroy

  has_many :events, through: :event_participants

  validates :email, allow_blank: false, length: { in: 6..72 },
            format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  validates :phone, allow_blank: true, phone: false, uniqueness: false

  validates :first_name, :last_name, presence: true, length: { maximum: 48 }

  before_save :downcase_email

  scope :accessible, lambda { |user|
    if [UserRole::Admin].include? user.role_code
    end
  }

  delegate :full_name, to: :attrs

  private

  def downcase_email
    email.downcase!
  end
end
