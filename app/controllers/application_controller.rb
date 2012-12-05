class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :last_posts_and_users

  def last_posts_and_users
    @last_posts = Post.last 10
    @last_users = User.includes(:posts).last 10
  end
end
