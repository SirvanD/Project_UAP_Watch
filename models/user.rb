require 'pg'

def logged_in?()
    if session[:user_id]
      return true
    else 
      return false
    end
  end
  
  def current_user()
    sql = "SELECT * FROM users WHERE id = #{ session[:user_id] };"
    user = db_query(sql).first
    return OpenStruct.new(user)
  end