class Place < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :menu_items, dependent: :destroy

  validates :name, presence: true

  # change the search methods ... watch the video!!

  pg_search_scope :search_category_name_address_cuisine,
  against: [:category, :name, :address, :cuisine],
  using: {
    tsearch: { prefix: true }
  }
end
