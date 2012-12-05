class Post < ActiveRecord::Base
  attr_accessible :body, :title
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :author_id
  validates :body, :length => { :maximum => 1024 }
  belongs_to :author, :class_name => :user, :foreign_key => :author_id
end
