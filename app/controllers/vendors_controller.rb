class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
    @vendor_reviews_and_rating = VendorReviewsAndRating.where("vendor_id=?", params[:id])
  end

  def index
    @vendor = Vendor.all
    @vendor_photo = VendorPhoto.all
    @page_hit = PageHit.find_by_url(request.original_url)
  end

  def new
  end

  private
  def vendor_params
    params.require(:vendors).permit(:name, :location)
  end
end

