require 'pg'

def db_query (sql, params = [])

    conn = PG.connect(dbname: 'project2')
    result = conn.exec_params(sql, params)
    conn.close
    return result

end

def all_likes()

result = db_query("SELECT * FROM likes ORDER BY user_id ASC NULLS LAST;") 
return result;
end

def post_like(user_id, post_id)

    sql = "INSERT INTO likes(user_id,post_id) VALUES ($1,$2);"

    db_query(sql,[user_id,post_id])


end




def update_image_likes(likes,id)
    sql = "UPDATE images SET likes = $1 WHERE id = $2;"
    db_query(sql, [likes,id])
end


def post_dislike(user_id, post_id)
    
    sql = "DELETE FROM likes where user_id = $1 AND post_id = $2;"
    db_query(sql,[user_id,post_id])


end