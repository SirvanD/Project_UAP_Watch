require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require 'bcrypt'
require 'cloudinary'

require_relative 'models/sighting.rb'
require_relative 'models/user.rb'
require_relative 'controllers/image_controller.rb'
require_relative 'controllers/user_controller.rb'


enable :sessions





get '/' do
  users = all_users()
  result = all_images()
  # binding.pry

  # def get_profile_url()
  #   result.to_a.each do |image|
  #     if image['user_id'] == users
  #     image['profile_url'] = users

  # end
  erb(:index, locals: {
    images: result,
    users: users
  })
  
end


 get '/images/new' do
  redirect '/login' unless logged_in?

  erb(:new)
 end

# Cloudinary API for storing images
 options = {
  cloud_name: 'do33kjp1o',
  api_key: ENV['CLOUDINARY_API_KEY'],
  api_secret: ENV['CLOUDINARY_API_SECRET']
}


 post '/images' do 

  file = params['image_url']['tempfile']
  image_uploaded = Cloudinary::Uploader.upload(file,options)
  # result['url'] is my url here
  result = image_uploaded['url']
post_image(params["name"],params["location"],params["date"],params["description"],result,current_user.id,current_user.profile_url,current_user.name,current_user.email)

  redirect '/'
 end


get '/login' do
  erb :login
end

get '/images' do
  result = all_images()
erb(:posts, locals: {
  images: result
})
end


delete '/images/:id' do

  delete_image(params['id'])

  redirect '/images'
end


get '/images/:id/edit' do

  sql = "SELECT * FROM images WHERE id = $1;"
  image = db_query(sql, [params['id']]).first

erb(:edit, locals:{
image: image
})
end



put '/images/:id' do

  update_image(
    params['name'],
    params['location'],
    params['date'],
    params['description'],
    params['id']
  )

redirect '/images'
end


get '/signup' do

erb(:signup)
end



post '/user' do

  file = params['image_url']['tempfile']
  profile_uploaded = Cloudinary::Uploader.upload(file,options)
  # result['url'] is my url here
  result = profile_uploaded['url']
  create_user(params["name"],params["email"],params["password"],result)

redirect '/login'
end


post '/session' do

  email = params['email']
  password = params['password']

  conn = PG.connect(dbname: 'project2')
  sql = "SELECT * FROM users WHERE email = '#{email}';"
  result = conn.exec(sql)
  conn.close


  if result.count > 0 && BCrypt::Password.new(result[0]['password_digest']) == password

    session[:user_id] = result[0]['id']
    redirect '/'

    else
      erb :login
  end

end



delete '/session' do

  session[:user_id] = nil

  redirect '/login'

end










