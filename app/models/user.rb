class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :trackable
  has_many :posts, :inverse_of => :author, :foreign_key => :author_id
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :provider, :uid
  validates_presence_of :name, :allow_blank => false
  # attr_accessible :title, :body

  def self.find_for_oauth(name, uid, provider)
    unless user = User.where(:provider => provider, :uid => uid).first
      user = User.create name:    name,
                         provider:provider,
                         uid:     uid
    else
      user
    end
  end
end
