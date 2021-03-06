class Sandwich < ActiveRecord::Base
	has_many :comments
	has_many :sandwich_ingredients
	has_many :ingredients, through: :sandwich_ingredients
	
	acts_as_votable
	mount_uploader :sandwich_image, SandwichImageUploader

	def self.find_unvoted_for(user)
		voted_ids = ActsAsVotable::Vote.where(votable_type: "Sandwich")
															 .where(voter_id: user.id)
															 .map(&:votable_id)
		self.where.not(id: voted_ids)
	end
end
