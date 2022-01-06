require 'sinatra'
require 'sinatra/reloader'
require 'pg'

# require 'pry'
require 'bcrypt'

require_relative 'models/sighting.rb'

enable :sessions


get '/' do

  result = db_query("SELECT * FROM images ORDER BY name;")

  erb(:index, locals: {
    images: result
  })
end







