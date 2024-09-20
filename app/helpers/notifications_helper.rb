module NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "Post"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.title}を投稿しました"
    when "Favorite"
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにいいねされました"
    else
      "投稿した#{notification.notifiable.post.title}が#{notification.notifiable.user.name}さんにコメントされました"
#    else
 #     "#{notification.notifiable.user.name}さんにフォローされました"
    end
  end
end
