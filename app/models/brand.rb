class Brand < ActiveRecord::Base
  validates :name, presence: true
  validates :country, presence: true

  has_many :phones
end
