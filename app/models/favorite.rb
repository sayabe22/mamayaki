class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  varidates :user_id, uniqueness: {scope: :post_id}
  
end
