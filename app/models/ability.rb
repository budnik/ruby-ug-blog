class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    unless user.persisted?
        can :read, :all?
    else
        #Add ability for loged in user
    end
  end
end
