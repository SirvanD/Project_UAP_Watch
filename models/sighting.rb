require 'pg'

def db_query (sql, params = [])

    conn = PG.connect(dbname: 'project2')
    result = conn.exec_params(sql, params)
    conn.close
    return result

end