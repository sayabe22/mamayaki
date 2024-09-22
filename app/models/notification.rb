class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true
end

notification = Notification.new(user_id: 7, notifiable_id: 10, notifiable_type: "Relationship")

if notification.save
  puts "Notification created successfully"
else
  puts "Failed to create notification: #{notification.errors.full_messages.join(", ")}"
end