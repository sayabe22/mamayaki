class Relationship < ApplicationRecord
  
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  has_one :notification, as: :notifiable, dependent: :destroy
  
  after_create do
    Notification.create!(
      user_id: followed_id,
      notifiable_id: id,
      notifiable_type: "Relationship")
  end
  
end
