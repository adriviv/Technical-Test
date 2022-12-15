require "application_system_test_case"

class ProductsTest < application_system_test_case
  test "Destroy a booking destroys the missions associated" do
    Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date)
    mission = Mission.create!(listing_id: booking.listing_id, mission_type: 'first_checkin', date: booking.start_date, price: 20)
    Booking.last.delete
    assert_equal "", mission
  end
end
