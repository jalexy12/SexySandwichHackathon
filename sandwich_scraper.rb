require 'nokogiri'
require 'open-uri'

sandwich_page = Nokogiri::HTML(open("https://www.thrillist.com/food/nation/national-sandwich-day"))

sandwich_names = sandwich_page.css(".caption > strong").map { | sandwich | 
	sandwich_text = sandwich.text.split(" ")[1..-1].join(" ")
}[0..-2]

sandwich_images = sandwich_page.css(".desktop > .img").map { | sandwich |
	stripped = sandwich.attributes["style"].value.gsub(/background-image:url/, "").gsub(/[()]/, "").gsub("//", "")
}[0..-2]

packaged = [] 
(0..sandwich_names.length - 1).each do | num | 
	packaged << sandwich_names[num]
	packaged << " " 
	packaged << sandwich_images[num]
end

packaged.each_slice(3) { | sandwich_package | 
	open("./public/sandwich_list.txt", "a") { | f | 
		f.puts sandwich_package.join("***")
	}
}