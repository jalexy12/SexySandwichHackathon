class Sandwich < ActiveRecord::Base
	acts_as_votable
	mount_uploader :sandwich_image, SandwichImageUploader
end
