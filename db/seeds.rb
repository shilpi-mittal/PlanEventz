# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def picToBlob(image_file)
  begin
    fin = File.open image_file, "rb"
    img = fin.read
  rescue SystemCallError => e
    puts e
  ensure
    fin.close if fin
  end

  blob = SQLite3::Blob.new img
end

User.create(firstname: 'anonymous')

Vendor.create(vendor_sub_category_id:1, name: 'vendor_name', location: 'vendor_location', address: 'vendor_address', phone: 'vendor_phone', description: 'vendor_des', website: 'vendor_web', events_handled: 5, category_id: 1)
Vendor.create(vendor_sub_category_id:2, name: 'vendor_name2', location: 'vendor_location2', address: 'vendor_address2', phone: 'vendor_phone2', description: 'vendor_des2', website: 'vendor_web2', events_handled: 10, category_id: 1)
Vendor.create(vendor_sub_category_id:1, name: 'vendor_name3', location: 'vendor_location3', address: 'vendor_address3', phone: 'vendor_phone3', description: 'vendor_des3', website: 'vendor_web3', events_handled: 4, category_id: 2)
Vendor.create(vendor_sub_category_id:2, name: 'vendor_name4', location: 'vendor_location4', address: 'vendor_address4', phone: 'vendor_phone4', description: 'vendor_des4', website: 'vendor_web4', events_handled: 20, category_id: 2)

VendorReviewsAndRating.create(review:"Review 1", rating: 4, vendor_id: 1, user_id: 1)
VendorReviewsAndRating.create(review:"Review 2", rating: 1, vendor_id: 1, user_id: 1)

VendorReviewsAndRating.create(review:"Review 3", rating: 1, vendor_id: 2, user_id: 1)
VendorReviewsAndRating.create(review:"Review 4", rating: 1, vendor_id: 2, user_id: 1)

PageHit.create(url:"/vendors/1", count:0)

blob = picToBlob("app/assets/images/partyTable.jpg")
VendorPhoto.create(vendor_id:1, photo: blob, description: "abc")
VendorPhoto.create(vendor_id:2, photo: blob, description: "abc")

blob = picToBlob("app/assets/images/facePainting.jpg")
VendorPhoto.create(vendor_id:1, photo: blob, description: "def")

VendorCategory.create(category: 'Attires')
VendorCategory.create(category: 'Decorators')
VendorCategory.create(category: 'Bakers')
VendorCategory.create(category: 'Caterers')
VendorCategory.create(category: 'Fun Eats')
VendorCategory.create(category: 'Event Managers')
VendorCategory.create(category: 'Party Accessories Providers')
VendorCategory.create(category: 'Photographers')
VendorCategory.create(category: 'Printers')
VendorCategory.create(category: 'Rental Providers')
VendorCategory.create(category: 'Transport Providers')
VendorCategory.create(category: 'Venue Providers')


blob = picToBlob("app/assets/images/sub_categories/birthday.jpg")
VendorSubCategory.create(sub_category: 'Birthday Party', pic:blob)
blob = picToBlob("app/assets/images/sub_categories/cooperate_party.jpg")
VendorSubCategory.create(sub_category: 'Co-operate Party', pic:blob)
blob = picToBlob("app/assets/images/sub_categories/wedding.jpg")
VendorSubCategory.create(sub_category: 'Wedding', pic:blob)
blob = picToBlob("app/assets/images/sub_categories/get_together.jpg")
VendorSubCategory.create(sub_category: 'Get Together', pic:blob)
