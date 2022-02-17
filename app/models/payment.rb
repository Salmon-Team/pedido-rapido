class Payment < ApplicationRecord
  belongs_to :order
  validates_presence_of :method
  validates :amount, numericality: { other_than: 0 }
  enum method: { pix: 1, card: 3, money: 3 }
end
