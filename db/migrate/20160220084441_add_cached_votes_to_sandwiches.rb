class AddCachedVotesToSandwiches < ActiveRecord::Migration
  def change
	   add_column :sandwiches, :cached_votes_total, :integer, :default => 0
	   add_column :sandwiches, :cached_votes_score, :integer, :default => 0
	   add_column :sandwiches, :cached_votes_up, :integer, :default => 0
	   add_column :sandwiches, :cached_votes_down, :integer, :default => 0
	   add_index  :sandwiches, :cached_votes_total
	   add_index  :sandwiches, :cached_votes_score
	   add_index  :sandwiches, :cached_votes_up
	   add_index  :sandwiches, :cached_votes_down

	   # Uncomment this line to force caching of existing votes
	   Sandwich.find_each(&:update_cached_votes)
  	 
  end
end
