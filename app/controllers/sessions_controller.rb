class SessionsController
  def initialize
    @user_view = UserView.new
  end

  def sign_in
    user_login_details = @user_view.ask_for_login_details
  end


end
