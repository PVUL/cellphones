class Phone < ActiveRecord::Base
  validates :brand, presence: true
  validates :year, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 2003 }
  validates :battery, presence: true

  belongs_to :brand
end
