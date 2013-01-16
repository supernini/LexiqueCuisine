class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_lexique

  def set_lexique
    @lexique = Lexique.new
    @lexique[:name]=params[:lexique][:name] if params[:lexique] and params[:lexique][:name]
  end

  def authenticate_admin!
    if user_signed_in? && current_user.is_admin==true
      authenticate_user!
    else
      redirect_to new_user_session_path
    end
  end
end
