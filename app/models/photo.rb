class Photo < ApplicationRecord
  validates :photo, presence: true

  belongs_to :user
  has_one_attached :photo
end
