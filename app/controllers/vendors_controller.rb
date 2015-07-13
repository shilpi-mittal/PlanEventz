class VendorsController < ApplicationController
  def show
    @vendor = Vendor.where('id=? and is_verified=?', params[:id], true)[0]
    @vendor_reviews_and_rating = VendorReviewsAndRating.where("vendor_id=?", params[:id])
  end

  def index
    @vendor = Vendor.where('is_verified=?', true)
    @vendor_photo = VendorPhoto.all
    @page_hit = PageHit.find_by_url(request.original_url)
  end

  def new
    @vendor = Vendor.new
    @vendor.is_verified = false
  end

  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.is_verified = false
    @current_user = current_user()
    @vendor.user_id=@current_user.id
      uploaded_io = params[:vendor][:cover_pic]
      if uploaded_io!=nil
        @vendor.cover_pic = SQLite3::Blob.new uploaded_io.read
      end

    if @vendor.save
      uploaded_io = params[:vendor][:gallery_pic]
      if uploaded_io!=nil
        uploaded_io.each do |pic|
          @vendor_photo = VendorPhoto.new
          @vendor_photo.vendor_id = @vendor.id
          @vendor_photo.photo = SQLite3::Blob.new pic.read
          @vendor_photo.save
        end
      end
      @user = User.find(@vendor.user_id)
      @user.is_vendor = true
      @user.save
      redirect_to new_register_yourselves_path
      Notifier.new_vendor_welcome_mail(@vendor).deliver_now
    else
      render 'new'
    end
  end

  private
  def vendor_params
    params.require(:vendor).permit(:name, :location, :category_id, :phone)
  end
end

