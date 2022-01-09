require 'pg'
require 'bcrypt'

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




def all_users()

    sql = "SELECT * FROM users;"
    result = db_query(sql)

end



def create_user(name,email,password,profile_url)

    conn = PG.connect(dbname: 'project2')
    password_digest = BCrypt::Password.create(password)

    sql = "INSERT INTO users(name,email,password_digest,profile_url) Values('#{name}','#{email}','#{password_digest}','#{profile_url}');"

    conn.exec(sql)
    conn.close

end


def update_user(name,email,profile_url,id)
    sql = "UPDATE users SET name = $1, email = $2, profile_url = $3 WHERE id = $4;"
    db_query(sql, [name,email,profile_url,id])
    update_image_profile(name,email,profile_url,id)

end