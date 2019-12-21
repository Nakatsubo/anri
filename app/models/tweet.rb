class Tweet < ApplicationRecord
  belongs_to :photo
  belongs_to :user
  has_many :retweets, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :text, presence: true, length: { maximum: 116 }

  scope :recent, -> { order(id: :desc) }
  scope :recent_info, -> { order(id: :desc).limit(3) }
end
