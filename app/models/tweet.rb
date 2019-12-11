class Tweet < ApplicationRecord
  belongs_to :photo
  belongs_to :user

  validates :text, presence: true, length: { maximum: 116 }
end
