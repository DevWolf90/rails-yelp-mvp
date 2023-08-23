class Restaurant < ApplicationRecord
  validates :name, :address, :category, presence: true
  has_many :reviews, dependent: :destroy

  CATEGORIES = %w[chinese italian japanese french belgian]
  validates :category, inclusion: CATEGORIES
end
