class VendorSubCategoriesController < ApplicationController
  def show
    @vendor_sub_category = VendorSubCategory.find(params[:id])
    @vendor_category = VendorCategory.find(params[:vendor_category_id])
    @vendor = Vendor.where("category_id=? and vendor_sub_category_id=?", params[:vendor_category_id], params[:id])
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

