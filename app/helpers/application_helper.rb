module ApplicationHelper

  def get_vendor_cover_photo(vendor_id)
    @vendor_photo = VendorPhoto.find_by_vendor_id(vendor_id)
  end

  def get_all_vendor_photos(vendor_id)
    @vendor_photo = VendorPhoto.where("vendor_id=?",vendor_id)
  end

  def get_category(vendor_id)
    category_id = Vendor.find(vendor_id)['category_id']
    VendorCategory.find(category_id)['category']
  end

  def get_sub_category(vendor_id)
    sub_category_id = Vendor.find(vendor_id)['vendor_sub_category_id']
    VendorSubCategory.find(sub_category_id)['sub_category']
  end

  def get_all_categories
    @vendor_categories = VendorCategory.all
  end

  def get_all_sub_categories
    @vendor_categories = VendorSubCategory.all
  end

end
