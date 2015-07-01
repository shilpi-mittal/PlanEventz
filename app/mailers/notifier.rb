class Notifier < ApplicationMailer
  default from: 'mail.planeventz@gmail.com',
          return_path: 'mail.planeventz@gmail.com'

  def welcome()
    mail(to: "shilpi@izumionline.in") do |format|
      format.text
      format.html
    end
    # mail(to: recipient.email_address_with_name,
    #      bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end

  def new_review_mail(review)
    @review = review
    user = User.find(review.user_id)
    @user_name = user['firstname']
    user_email_id = user['email']
    @vendor = Vendor.find(@review.vendor_id)
    # @baseUrl = request.original_url
    mail(to: user_email_id,
         bcc: "shilpi@izumionline.in", subject: "Your review is added") do |format|
      format.text
      format.html
    end
    end

  def new_vendor_welcome_mail(vendor)
    @vendor = vendor
    user = User.find(@vendor.user_id)
    @user_name = user['firstname']
    user_email_id = user['email']
    mail(to: user_email_id,
         bcc: "shilpi@izumionline.in", subject: "Your business " + @vendor.name+" is added") do |format|
      format.text
      format.html
    end
  end
end
