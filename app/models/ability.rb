class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.persisted?
      #Add ability for loged in user
      can :manage, Post, :author_id => user.id
      can :create, Post
    end

    can :read, :all
  end
end
