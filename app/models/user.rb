class User < ActiveRecord::Base
  include Paperclip::Glue
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  attr_accessible  :provider, :uid, :login, :username, :email, :password, :password_confirmation, :remember_me, :name, :avatar
  attr_accessor :login
  has_many :comments

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20]
                           )
    end
    user
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:email => data["email"]).first
      unless user
          user = User.create(provider: 'google',
              avatar: open(data["image"]),
               name: data["name"],
  	    		   email: data["email"],
  	    		   password: Devise.friendly_token[0,20]
  	    		  )
      end
      user
  end
end
