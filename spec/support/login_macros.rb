module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in(user)
    visit login_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end
end