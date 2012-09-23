class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  # Prevent all invites through web
  def authenticate_inviter!
    false
  end
end
