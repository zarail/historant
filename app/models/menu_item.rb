class MenuItem < ApplicationRecord
  belongs_to :place
  has_one :user, through: :place

  validates :name, presence: true
end
