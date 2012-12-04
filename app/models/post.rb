class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates :body, :length => { :maximum => 1024 }

end
