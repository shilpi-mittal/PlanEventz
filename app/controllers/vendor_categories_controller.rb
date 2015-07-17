class VendorCategoriesController < ApplicationController
  def show
    @vendor_category = VendorCategory.find(params[:id])
    @vendor = Vendor.where("category_id=? and is_verified=?", params[:id], true)
    @vendor_photo = VendorPhoto.all
    @page_hit = PageHit.find_by_url(request.original_url)
  end

  def index
  end

  def new
  end

  private
  def vendor_params
    params.require(:vendors).permit(:name, :location)
  end
end

