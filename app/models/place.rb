class Place < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :menu_items, dependent: :destroy

  validates :name, presence: true

  include PgSearch::Model

  pg_search_scope :search_category_name_address_cuisine,
  against: [:category, :name, :address, :cuisine],
  using: {
    tsearch: { prefix: true }
  }
end
