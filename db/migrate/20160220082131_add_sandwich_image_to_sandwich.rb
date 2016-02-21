class AddSandwichImageToSandwich < ActiveRecord::Migration
  def change
    add_column :sandwiches, :sandwich_image, :string
  end
end
