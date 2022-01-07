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


def post_image(name, location, date, description, image_url,user_id)

    sql = "INSERT INTO images(name,location,date,description,image_url,user_id) VALUES($1,$2,$3,$4,$5,$6)  ;"

    db_query(sql, [name,location,date,description,image_url,user_id])

end


def delete_image(id)

    db_query("DELETE FROM images WHERE id = $1;", [id])


end