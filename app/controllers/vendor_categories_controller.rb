class VendorCategoriesController < ApplicationController
  def show
    @vendor_category = VendorCategory.find(params[:id])["category"]
    @vendor = Vendor.where("category_id=?", params[:id])
    @vendor_photo = VendorPhoto.all
    @page_hit = PageHit.find_by_url(request.original_url)
  end

  def index
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

