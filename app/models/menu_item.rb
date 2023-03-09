class MenuItem < ApplicationRecord
  belongs_to :place
  has_one_attached :photo

  validates :name, :description, :visit_date, presence: true
end
