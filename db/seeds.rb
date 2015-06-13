# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


articles_list = [
    [ "Germany", 81831000 ],
    [ "France", 65447374 ],
    [ "Belgium", 10839905 ],
    [ "Netherlands", 16680000 ]
]

articles_list.each do |title, text|
  Article.create( title: title, text: text )
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

PageHit.create(url:"http://localhost:3000/vendors/1", count:0)

begin
  fin = File.open "app/assets/images/partyTable.jpg" , "rb"
  img = fin.read
rescue SystemCallError => e
  puts e
ensure
  fin.close if fin
end

blob = SQLite3::Blob.new img
VendorPhoto.create(vendor_id:1, photo: blob, description: "abc")
VendorPhoto.create(vendor_id:2, photo: blob, description: "abc")

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

VendorSubCategory.create(sub_category: 'Birthday Party')
VendorSubCategory.create(sub_category: 'Co-operate Party')
VendorSubCategory.create(sub_category: 'Wedding')
VendorSubCategory.create(sub_category: 'Get Together')
