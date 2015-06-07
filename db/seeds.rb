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