# frozen_string_literal: true

class Ability
  include CanCan::Ability
  attr_reader :user

  def initialize(user)
    @user = user

    alias_action :create, :read, :update, :destroy, to: :crud

    register if user.register?
    admin if user.admin?
  end

  def register
    can :read, Movie
  end

  def admin
    can :crud, Movie
  end
end
