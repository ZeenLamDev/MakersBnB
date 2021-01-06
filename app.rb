require "sinatra/flash"
require "sinatra/base"
require "./database_connection_setup"
require 'bcrypt'
require_relative './lib/space'


class MakersBnB < Sinatra::Base

  get "/" do
    redirect('users/new')
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  get '/spaces/filter' do
    @spaces = Space.filter(from: params[:available_from], to: params[:available_to])
    erb :'spaces/index'
  end

  get "/spaces" do
    @spaces = Space.all
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
