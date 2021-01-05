require "sinatra/flash"
require "sinatra/base"
require "./database_connection_setup"
require 'bcrypt'


class MakersBnB < Sinatra::Base
  get "/" do
    redirect('users/new')
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get "/spaces" do
    erb :'spaces/index'
  end

  post "/spaces" do
    Space.create(name: params[:name], description: params[:description], price: params[:price], date_available_from: params[:date_available_from], date_available_to: params[:date_available_to])
    redirect('/spaces')
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    User.create(email: params[:email],password: params[:password])
    redirect('/spaces')
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
