class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Category, Product]

    return unless user

    can :read, User, id: user.id
    can :update, User, id: user.id

    if user.admin?
      can :manage, [Category, Product, Order], org_id: user.org_id
      can :manage, User

      can :manage, ProductVariant, product: { org_id: user.org_id }

    elsif user.customer?
<<<<<<< HEAD
      can :read, [Category, Product], org_id: user.org_id
      can :read, ProductVariant
fix/ecommerce-web-backend-polish
  can :read, User, id: user.id
  can :update, User, id: user.id
=======
  can :read, [Category, Product], org_id: user.org_id
  can :read, ProductVariant

>>>>>>> 54dc8ee (Fix: Ensure all roles can read their own profile to prevent login crash)
  can :create, Order
  can :read, Order, user_id: user.id
  can :update, Order, user_id: user.id
  can :cancel, Order, user_id: user.id
      can :read, User, id: user.id
      can :create, Order
      can [:read, :update, :cancel], Order, user_id: user.id
main
    end
  end
end