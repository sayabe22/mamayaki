# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

みか = User.find_or_create_by!(email: "mika@example.com") do |user|
  user.name = "みか"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

けい = User.find_or_create_by!(email: "kei@example.com") do |user|
  user.name = "けい"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

ままんぬ = User.find_or_create_by!(email: "mamanmu@example.com") do |user|
  user.name = "ままんぬ"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Post.find_or_create_by!(title: "8月30日") do |post|
  post.body = "今日も暑いですね。皆さんはお子さんの熱中症対策どうしていますか。"
  post.user_id = 1
end

Post.find_or_create_by!(title: "共感者求む") do |post|
  post.body = "４歳になる息子が全く言うことを聞いてくれません。どなたか良い解決策お持ちでないですか。"
  post.user_id = 2
end

Post.find_or_create_by!(title: "先日見かけた光景")  do |post|
  post.body = "小さい子供にリールをつけている方がたまにいますがみなさんどのように思いますか。"
  post.user_id = 3
end