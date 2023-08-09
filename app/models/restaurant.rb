class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true

  CUISINES = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :category, inclusion: { in: CUISINES }, presence: true
end
