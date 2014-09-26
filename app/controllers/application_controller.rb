class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def unprocessable_entity(resource)
    { :json => resource.errors, status: :unprocessable_entity }
  end

  def not_found
    { :json => {success: false,
                error: "Resource not found",
                status: "404"}, status: :not_found }
  end

  def not_permitted
    { :json => {success: false,
                error: "You don't have permission to view or modify that resource",
                status:  "401"},
                :status => "401" }
  end

  def deleted
    { :json => {success: true,
                message: "Resource successfully deleted.",
                status: "204"} }
  end
end
