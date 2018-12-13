class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable ,:omniauth_providers => [:facebook],:omniauth_providers => [:google_outh2]

    has_many :subscriptions
	has_many :projects ,through: :subscriptions
	has_many :reviews
   validates :name ,presence: true , length:{maximum:25}      

   def self.find_for_google_oauth2(access_token,signed_in_resourse=nil)
	   	data=access_token.info
	   	user=User.where(:provider => access_token.provider ,:uid=> access_token.uid).first

	   	if user
	   		 return user
	   	else
	   		registerable_user =User.where(:email =>access_token.email).first
	   		if registerable_user
	   			return registerable_user
	   		else
	   			user=User.create(
	   				name: data["name"],
	   				provider: access_token.provider,
	   				email: data["email"],
	   				uid: access_token.uid,
	   				image: data["image"],
	   				password: Divise.friendly_token[0,20])
	   		end
	 	end  	
   end
    def self.find_for_facebook_oauth(access_token,signed_in_resourse=nil)
	   	data=access_token.info
	   	user=User.where(:provider => access_token.provider ,:uid=> access_token.uid).first

	   	if user
	   		 return user
	   	else
	   		registerable_user =User.where(:email => data.email).first
	   		if registerable_user
	   			return registerable_user
	   		else
	   			user=User.create(
	   				name: access_token.extra.raw_info.name,
	   				provider: access_token.provider,
	   				email: data.email,
	   				uid: access_token.uid,
	   				image: data.image,
	   				password: Divise.friendly_token[0,20])
	   		end
	 	end  	
   end
end
