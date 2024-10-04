class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :set_user_cookie

  private

  def set_user_cookie
    cookies[:uid] ||= SecureRandom.hex(10)
  end
end
