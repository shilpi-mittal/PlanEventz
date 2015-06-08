class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
  end

  def index
    @vendor = Vendor.all
    @user = User.find(params[:id], 1)
  end

  def new
  end

  private
  def vendor_params
    params.require(:vendors).permit(:name, :location)
  end
end

