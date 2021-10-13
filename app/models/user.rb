class User < ApplicationRecord

	has_one_attached :image
	has_many :groups
  has_many :entries
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,:omniauthable,
  omniauth_providers: [:google_oauth2]


  def self.from_omniauth(access_token)
  	data = access_token.info
  	user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(username: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end

end
