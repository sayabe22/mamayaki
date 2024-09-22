class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :post
  has_one :notification, as: :notifiable, dependent: :destroy
  
  after_create do
    create_notification(user_id: post.user_id)
  end 
  
  validates :user_id, uniqueness: {scope: :post_id}
  
end
