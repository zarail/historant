class MenuItem < ApplicationRecord
  belongs_to :place
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
end
