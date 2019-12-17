class User < ApplicationRecord
  devise :database_authenticatable,
         :rememberable,
         :omniauthable

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid: auth.uid,
        provider: auth.provider,
        email: User.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        image: auth.info.image,
        name: auth.info.name,
        nickname: auth.info.nickname,
        location: auth.info.location,
        description: auth.info.description,
        website: auth.info.urls[:Website],
        twitter: auth.info.urls[:Twitter]
      )
    end
    user
  end

  has_many :photos, dependent: :destroy
  has_many :tweets, dependent: :destroy

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
