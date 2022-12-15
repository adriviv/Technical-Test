class Mission < ApplicationRecord
  belongs_to :listing

  validates :date, presence: true
  validates :mission_type, presence: true
  validates :price, presence: true
end
