class Ability
  include CanCan::Ability

  def initialize(user)
    user = user || User.new # for guest
    if user.role == "reporter"
      can :create, Article
      can :manage, Article, :user_id => user.id
      cannot :edit, Article, :is_published => true
      cannot :publish ,Article
      can :edit_profile, User
      can :update, User, :id => user.id
    elsif user.role == "editor"
      can :manage, Article
      cannot [:create, :edit], Article
      can [:edit_profile, :update], User, :id => user.id
    elsif user.role == "admin"
      can :manage, User
    end
    can :read, Article, :is_published => true

  end
end
