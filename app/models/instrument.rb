class Instrument < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 40 }
  validates :abbrevation, presence: true, length: { maximum: 10 }
  validates :size, presence: true
  validates :price_per_month, presence: true, 
                              numericality: { less_than_or_equal_to: 20 }
end
