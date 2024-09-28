# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mika = User.find_or_create_by!(email: "mika@example.com") do |user|
  user.name = "mika"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

kei = User.find_or_create_by!(email: "kei@example.com") do |user|
  user.name = "kei"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

ままんぬ= User.find_or_create_by!(email: "mamanmu@example.com") do |user|
  user.name = "ままんぬ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

 ppp= User.find_or_create_by!(email: "ppp@example.com") do |user|
  user.name = "ppp"
  user.password = "password"
end

Post.find_or_create_by!(title: "8月30日") do |post|
  post.body = "今日も暑いですね。皆さんはお子さんの熱中症対策どんなことしていますか。"
  post.user_id = 2
end

Post.find_or_create_by!(title: "遊園地へ") do |post|
  post.body = "本日は家族で遊園地へ。子供が喜ぶ姿を見ると癒されますね。"
  post.user_id = 3
end

Post.find_or_create_by!(title: "先日見かけた光景")  do |post|
  post.body = "小さい子供にリールをつけている方がたまにいますがみなさんどのように思いますか。"
  post.user_id = 4
end

PostComment.find_or_create_by!(comment: "クルーネックリングは必須ですね。", user_id: 4, post_id: 1)

PostComment.find_or_create_by!(comment: "我が家はハンディタイプの扇風機を持ち歩いています。", user_id: 3, post_id: 1)

PostComment.find_or_create_by!(comment: "子どもの安全のためなので一概に否定はできないですよね～", user_id: 3, post_id: 3)

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')