class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    can :manage, :all if user.role? :admin
    if user.role? :full_service
      can [:sites_by_name, :get_formats, :labels_by_name, :search_by_name], [Account]
      can :manage, InsertionOrder
    end
    if user.role? :self_service
      can :manage, [Campaign, Report]
    end
    if user.role? :markets_admin
      can :manage, [MarketsPublisher]
      can [:search_by_name], [Account]
    end
    if user.role? :markets_rep_admin
      can [:show, :programmatic_report, :search_rep_orders, :records], [MarketsPublisher]
    end
    if user.role? :markets_reporter
      can [:show, :programmatic_report, :report_contacts, :save_report_contacts, :records], [MarketsPublisher]
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #  can :manage, :all
    #   else
    #  can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
