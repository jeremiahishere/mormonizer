class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, :through => :user_roles

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :role_ids

  def name
    self.email
  end

  def has_role?(role_sym)
    roles.any? { |r| r.name.underscore.to_sym == role_sym }
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create(:email => data["email"], :password => Devise.friendly_token[0,20])
    end
  end

  # note that this uses screen_name instead of email
  def self.find_for_twitter_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["screen_name"])
      user
    else # Create a user with a stub password.
      u = User.create(:email => data["screen_name"], :password => Devise.friendly_token[0,20])
      u.save
    end
  end
end
