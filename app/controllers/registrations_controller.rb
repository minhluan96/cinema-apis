class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    head :created, :user => resource
  end

  private

  def sign_up_params
    params.permit(:email, :password)
  end
end