class SearchResultsController < ApplicationController
  def show
    @vendor_query = Vendor.search do
      fulltext params[:search]
    end

    if @vendor_query.results.length != 0
      @vendor_query.results.each do |vendor|
        vendor_result = Vendor.where("id=? and is_verified=?", vendor["id"], true)
        if @vendor!=nil
          @vendor = @vendor + vendor_result
          @vendor.uniq!
        else
          @vendor = vendor_result
        end
      end
   end

    @vendor_category_query = VendorCategory.search do
      fulltext params[:search]
    end
    if @vendor_category_query.results.length != 0
        @vendor_category_query.results.each do |vendor_category|
          vendor_category_id = VendorCategory.find_by_category(vendor_category["category"])["id"]
          vendor_by_category_query = Vendor.where("category_id=? and is_verified=?",vendor_category_id, true)
          if @vendor!=nil
            @vendor = @vendor + vendor_by_category_query
            @vendor.uniq!
          else
            @vendor = vendor_by_category_query
          end
      end
    end

    # @vendor_sub_category_query = VendorSubCategory.search do
    #   fulltext params[:search]
    # end
    # if @vendor_sub_category_query.results.length != 0
    #   @vendor_sub_category_query.results.each do |vendor_sub_category|
    #     vendor_sub_category_id = VendorSubCategory.find_by_sub_category(vendor_sub_category["sub_category"])["id"]
    #     vendor_by_sub_category_query = Vendor.where("vendor_sub_category_id=?",vendor_sub_category_id)
    #     @vendor = @vendor + vendor_by_sub_category_query
    #     @vendor.uniq!
    #   end
    # end

  end

end