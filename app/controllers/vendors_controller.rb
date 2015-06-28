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
    @vendor = Vendor.new
  end

  def picToBlob(image_file)
    begin
      fin = File.open image_file, "rb"
      img = fin.read
    rescue SystemCallError => e
      puts e
    ensure
      fin.close if fin
    end

    return SQLite3::Blob.new img
  end

  def create
    @vendor = Vendor.new(vendor_params)
    uploaded_io = params[:vendor][:cover_pic]
    if uploaded_io!=nil
      @vendor.cover_pic = picToBlob(uploaded_io.read)
    end

    if @vendor.save
      redirect_to Vendor.all
    else
      render 'new'
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :location, :category_id, :phone)
  end
end

