class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

         def self.from_omniauth(auth)
         	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
         		user.provider = auth.provider
         		user.uid = auth.uid
         		user.name = auth.info.name
         		user.email = auth.info.email
            user.facebook_image_url = auth.info.image
         		user.password = Devise.friendly_token[0,20]
         	end
         end
end