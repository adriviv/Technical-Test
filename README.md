# Backend test

We are building a listing rentals management company

Create a new rails app. 


4 main objects populate our app:
- `listings`: apartments of our clients
- `bookings`: periods of time during which our clients leave us their apartment
- `reservations`: periods of time during which a guest rents one of our apartments
- `mission`: cleaning an apartment

`bookings`, `reservations` and `missions` all BELONG to `listing` (they all have a `listing_id`) but are not otherwise directly related to one another.

Here is our plan to clean the apartment, at any time:
- We should have a cleaning mission called `first_checkin` at the beginning of the booking
- We should have  a cleaning mission called `last_checkout` before the owner comes back
- We should have  a cleaning mission called `checkout_checkin` at the end of each reservation UNLESS there is already a last_checkout at the same date

Reservation and Bookings could be cancelled, in this case we should not do missions related.

We negotiated the prices with our cleaning partner:
- a first checkin costs 10€ per room
- a checkout checkin costs 10€ per room
- a last checkout costs 5€ per room

Here is the content you have to copy on your file `seed.rb` located in `./db/seeds.rb` 
```
Booking.delete_all
Reservation.delete_all
Mission.delete_all
Listing.delete_all

Listing.create!(num_rooms: 2)
Listing.create!(num_rooms: 1)
Listing.create!(num_rooms: 3)

Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-10".to_date, end_date: "2016-10-15".to_date)
Booking.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Booking.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-20".to_date)

Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-11".to_date, end_date: "2016-10-13".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-13".to_date, end_date: "2016-10-15".to_date)
Reservation.create!(listing_id: Listing.first.id, start_date: "2016-10-16".to_date, end_date: "2016-10-20".to_date)
Reservation.create!(listing_id: Listing.second.id, start_date: "2016-10-15".to_date, end_date: "2016-10-18".to_date)
```

## Goal

You need to create a Rails Application using Active records which has:
 - JSON API:
   - CRUD (INDEX/ SH0W/ CREATE/ UPDATE / DELETE ) on `listing`
   - Index endpoint to revrieve missions created

Note: no authentication is required

The output of the index endpoint to revrieve missions created should resemble this after launching the seed
```
{
  "missions": [
    {:listing_id=>1, :mission_type=>"first_checkin", :date=>"2016-10-10", :price=>20},
    {:listing_id=>1, :mission_type=>"last_checkout", :date=>"2016-10-15", :price=>10},
    {:listing_id=>1, :mission_type=>"first_checkin", :date=>"2016-10-16", :price=>20},
    {:listing_id=>1, :mission_type=>"last_checkout", :date=>"2016-10-20", :price=>10},
    {:listing_id=>1, :mission_type=>"checkout_checkin", :date=>"2016-10-13", :price=>20},
    {:listing_id=>2, :mission_type=>"first_checkin", :date=>"2016-10-15", :price=>10},
    {:listing_id=>2, :mission_type=>"last_checkout", :date=>"2016-10-20", :price=>5},
    {:listing_id=>2, :mission_type=>"checkout_checkin", :date=>"2016-10-18", :price=>10}
  ]
}
```
Go slowly, and write code that could be easily extensible and clean.
