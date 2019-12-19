class Search < ApplicationRecord
  validates :query, presence: true, length: { maximum: 255 }
end
