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

Vendor.create(vendor_sub_category_id:1, name: 'vendor_name', location: 'vendor_location', address: 'vendor_address', phone: 'vendor_phone', description: 'vendor_des', website: 'vendor_web')

VendorReviewsAndRating.create(review:"Review 1", rating: 4, vendor_id: 1, user_id: 1)
VendorReviewsAndRating.create(review:"Review 1", rating: 1, vendor_id: 1, user_id: 1)

PageHit.create(url:"http://localhost:3000/vendors/1", count:0)