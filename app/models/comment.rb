class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :sandwich
  has_many :comments
end
