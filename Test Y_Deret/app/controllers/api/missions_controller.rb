class Api::MissionsController < Api::BaseController
  def index
    Booking.all.each do |booking|
      mission = Mission.where(listing_id: booking.listing_id, mission_type: 'first_checkin', date: booking.start_date)
      Mission.create!(listing_id: booking.listing_id, mission_type: 'first_checkin', date: booking.start_date, price: 20) if mission.empty?
      mission = Mission.where(listing_id: booking.listing_id, mission_type: 'last_checkout', date: booking.end_date)
      Mission.create!(listing_id: booking.listing_id, mission_type: 'last_checkout', date: booking.end_date, price: 5) if mission.empty?
    end
    Reservation.all.each do |reservation|
      mission = Mission.where(listing_id: reservation.listing_id, date: reservation.end_date)
      Mission.create!(listing_id: reservation.listing_id, mission_type: 'checkout_checkin', date: reservation.end_date, price: 10) if mission.empty?
    end
    @missions = Mission.all
  end
end
