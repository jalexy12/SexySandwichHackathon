class Sandwich < ActiveRecord::Base
	acts_as_votable
	mount_uploader :sandwich_image, SandwichImageUploader
	has_many :comments

	def self.find_unvoted_for(user)
		voted_ids = ActsAsVotable::Vote.where(votable_type: "Sandwich")
															 .where(voter_id: user.id)
															 .map(&:votable_id)
		self.where.not(id: voted_ids)
	end
end
