class Api::BookingsController < Api::BaseController

  def create
      Mission.create!(listing_id: self.listing_id, mission_type: 'first_checkin', date: self.start_date, price: 20)
      Mission.create!(listing_id: self.listing_id, mission_type: 'last_checkout', date: self.end_date, price: 5)
  end

  def destroy
    @booking = Booking.find(params[:id])
    Mission.where(listing_id: @booking.listing_id, mission_type: 'first_checkin', date: @booking.start_date).destroy
    Mission.where(listing_id: @booking.listing_id, mission_type: 'last_checkout', date: @booking.end_date).destroy
    @booking.destroy
  end
end
