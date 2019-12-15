class Retweet < ApplicationRecord
  belongs_to :tweet

  validates :text, presence: true, length: { maximum: 116 }
end
