class Review < ApplicationRecord
  belongs_to :menu_item

  validates :visit_date, :rating, presence: true
end
