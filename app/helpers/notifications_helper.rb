module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.title}を投稿しました"
    when "Favorite"
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにいいねされました"
    when "PostComment"
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにコメントされました"
    else
      user = User.find(notification.notifiable.follower_id)
      "#{user.name}さんにフォローされました"
    end
  end
end
