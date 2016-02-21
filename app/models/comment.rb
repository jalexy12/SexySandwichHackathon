class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :sandwich
  has_many :comments

  after_create :send_pusher_notification

  private 

  def send_pusher_notification
  	Pusher.trigger('comments_channel', 'comment_created', {
  		comment: self,
  		count: self.sandwich.comments.count
  	})
  end
end
