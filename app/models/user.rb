class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :trackable
  has_many :posts, :inverse_of => :author, :foreign_key => :author_id
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :provider, :uid
  # attr_accessible :title, :body

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    unless user = User.where(:provider => auth.provider, :uid => auth.uid).first
      user = User.create name:    auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:     auth.uid
    else
      user
    end
  end
end
