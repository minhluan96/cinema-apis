class User < ApplicationRecord
  rolify :before_add => :before_add_action
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist

  has_and_belongs_to_many :roles, join_table: :users_roles

  after_create :assign_default_role
  delegate :can?, :cannot?, :to => :ability

  def assign_default_role
    self.add_role(Role::ROLES[:register]) if self.roles.blank?
  end

  def before_add_action
    Rails.logger.info "user: #{self.id} - before add role #{self.roles.map(&:id)}"
  end

  def jwt_payload
    super
  end

  def admin?
    role_set.include?(Role::ROLES[:admin])
  end

  def register?
    role_set.include?(Role::ROLES[:register])
  end

  def ability
    @ability ||= Ability.new(self)
  end

  private

  def role_set
    Set.new(roles.pluck(:name))
  end
end
