class Photo < ApplicationRecord
  belongs_to :user
  has_many :labels, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_one_attached :photo

  scope :recent, -> (current_user) { where(user_id: current_user.id).order(id: :asc).last }
end
