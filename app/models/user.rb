class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :provider, :uid
  # attr_accessible :title, :body
end
