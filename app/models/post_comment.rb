class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  has_one :notification, as: :notifiable, dependent: :destroy
  
  after_create do
    post = self.post
    Notification.create(
      user_id: post.user_id,
      notifiable_id: id,
      notifiable_type: "PostComment")
  end  
  
  validates :comment, presence: true
    
end
