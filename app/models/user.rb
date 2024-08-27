class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    has_many :posts, dependent: :destroy

  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :profile, length: {maximum: 60 }
end
