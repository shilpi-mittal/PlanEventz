class VendorReviewsAndRatingsController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @vendor_reviews_and_rating = VendorReviewsAndRating.new
  end

  def show
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @vendor_reviews_and_rating = VendorReviewsAndRating.new(review_and_rating_params)
    @vendor_reviews_and_rating.vendor_id=params[:vendor_id]
    @current_user = current_user
    @vendor_reviews_and_rating.user_id=@current_user.id

    if @vendor_reviews_and_rating.save
      redirect_to Vendor.find(params[:vendor_id])
      Notifier.new_review_mail(@vendor_reviews_and_rating).deliver_now
    else
      render 'new'
    end
    @vendor_all_reviews_and_rating = VendorReviewsAndRating.where("vendor_id=?", params[:vendor_id])
  end

  private
  def review_and_rating_params
    params.require(:vendor_reviews_and_rating).permit(:review, :rating)
  end

end

