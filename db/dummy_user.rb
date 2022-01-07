require 'pg'

require 'bcrypt'

name = "Luna"
email = "luna@ga.co"
password = "test3"

conn = PG.connect(dbname: 'project2')
password_digest = BCrypt::Password.create(password)

sql = "INSERT INTO users (name,email,password_digest) VALUES ('#{name}','#{email}','#{password_digest}');"

conn.exec(sql)
conn.close
puts "done!"