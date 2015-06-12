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

  def get_category(vendor_id)
    category_id = Vendor.find(vendor_id)['category_id']
    VendorCategory.find(category_id)['category']
    end

  def get_sub_category(vendor_id)
    sub_category_id = Vendor.find(vendor_id)['vendor_sub_category_id']
    VendorSubCategory.find(sub_category_id)['sub_category']
  end

  helper_method :get_category
  helper_method :get_sub_category

  private
  def vendor_params
    params.require(:vendors).permit(:name, :location)
  end
end

