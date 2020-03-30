class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name,presence: true,length:{minimum:2,maximum:20 }
  validates :introduction,length:{maximum:50}
  attachment :profile_image
end
