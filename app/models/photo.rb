class Photo < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy
  has_one_attached :photo
end
