class Api::ReservationsController < Api::BaseController
  def destroy
    @reservation = Reservation.find(params[:id])
    mission = Mission.where(listing_id: @reservation.listing_id, mission_type: 'checkout_checkin', date: @reservation.end_date)
    mission.destroy if mission.present?
    @reservation.destroy
  end
end
