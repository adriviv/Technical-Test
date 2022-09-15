class ListingController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

 def index
  @listings = Listing.all
 end

 def show
  @listing = Listing.find(set_listing)
 end

 def new
  @listing = Listing.new
 end

 def create
  @listing = Listing.new(listing_params)
  @listing.save
 end

 def edit
  @listing = Listing.find(set_listing)
 end

 def update
  @listing = Listing.find(set_listing)
  @listing.update(listing_params)
 end

 def destroy
  @listing = Listing.find(set_listing)
  @listing.destroy
 end

 private

 def set_listing
  @listing = Listing.find(params[:id])
 end

 def listing_params
    params.require(:listing).permit(:id, :num_rooms)
 end
end
