require 'sinatra'
require 'sinatra/reloader'
require 'pg'
# require 'pry'
require 'bcrypt'
require 'cloudinary'

require_relative 'models/sighting.rb'
require_relative 'models/user.rb'

enable :sessions





get '/' do

  result = all_images()

  erb(:index, locals: {
    images: result
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
post_image(params["name"],params["location"],params["date"],params["description"],result,current_user.id)

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










