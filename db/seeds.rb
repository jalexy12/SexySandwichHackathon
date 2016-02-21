# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sandwiches = IO.read('./public/sandwich_list.txt').split("\n")

sandwiches.each do | sandwich |
	pieces = sandwich.split("*** ***")
	name = pieces[0]
	image = pieces[1]

	puts "Creating sandwich: "
	puts name
	puts image
	Sandwich.create(name: name, 
			description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Magni libero omnis animi hic voluptates accusamus at ut iste facilis quia suscipit nemo voluptatum aliquam ipsam voluptate eius, nam praesentium. Autem.",
			sandwich_image: open("http://" + image)
	)
end