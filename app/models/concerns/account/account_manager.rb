class Account::AccountManager

  def initialize(session)
    case session[:user_type]
    when 'admin'
      @model = Admin::Account
    else
      raise ArgumentError
    end

    @user_id = session[:user_id]
    @session = session
  end

  def current_user
    @current_user ||= @model.find @user_id if @user_id
  end

  def login(username, password)
    @login ||= @model.where(username: username).first.try(:authenticate, password)
  end

  def logout
    @session.delete :user_type
    @session.delete :user_id
  end

  def username_available?(username)
    @taken ||= @model.where('lower(username) = ?', username.downcase).first
    not @taken
  end
end