class Api::ListingsController < Api::BaseController
  before action :set_listing, only: [ :show, :update, :destroy ]

  def index
    @listings = Listing.all
  end

  def show
  end

  def update
    if @listings.update(listing_params)
      render :show
    else
      render_error
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @listing.destroy
    head :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:id, :num_rooms)
  end

  def render_error
    render json: { errors: @listing.errors.full_message },
    status: :unprocessable_entity
  end
end
