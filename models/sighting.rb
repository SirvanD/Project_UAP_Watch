require 'pg'

def db_query (sql, params = [])

    conn = PG.connect(dbname: 'project2')
    result = conn.exec_params(sql, params)
    conn.close
    return result

end


def all_images()

    result = db_query("SELECT * FROM images ORDER BY name;")

end


def post_image(name, location, date, description, image_url,user_id,profile_url,user_name,user_email)

    sql = "INSERT INTO images(name,location,date,description,image_url,user_id,profile_url,user_name,user_email) VALUES($1,$2,$3,$4,$5,$6,$7,$8,$9);"

    db_query(sql, [name,location,date,description,image_url,user_id,profile_url,user_name,user_email])

end


def delete_image(id)

    db_query("DELETE FROM images WHERE id = $1;", [id])

end


def update_image(name, location, date, description,id)

    sql = "UPDATE images SET name = $1, location = $2, date = $3, description = $4 WHERE id = $5;"
    db_query(sql, [name,location,date,description,id])


end

def update_image_profile(name,email,profile_url,user_id)

sql = "UPDATE images SET user_name = $1, user_email = $2, profile_url = $3 WHERE user_id = $4;"
db_query(sql,[name,email,profile_url,user_id])

end