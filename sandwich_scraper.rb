require 'nokogiri'
require 'open-uri'

sandwich_page = Nokogiri::HTML(open("https://www.thrillist.com/food/nation/national-sandwich-day"))
# sandwiches = sandwich_page.css(".caption > strong").map { | sandwich | 
# 	sandwich_text = sandwich.text.split(" ")[1..-1].join(" ")
# }.join("\n")

# IO.write("./public/sandwich_list.txt", sandwiches)

sandwich_images = sandwich_page.css(".desktop > .img").map { | sandwich |
	puts sandwich.styles
}