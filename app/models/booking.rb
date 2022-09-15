class Booking < ApplicationRecord
  belongs_to :listing
  def create!
    create!
    Mission.create!(listing_id: self.listing_id, mission_type: 'first_checkin', date: self.start_date, price: 20)
    Mission.create!(listing_id: self.listing_id, mission_type: 'last_checkout', date: self.end_date, price: 5)
  end
end
